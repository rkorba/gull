.PHONY: clean win unix winbmi
	
BIN=./bin/
TARGET = $(BIN)gull
WIN_TARGET = $(BIN)gull.exe

BMI_FLAGS := -mbmi -mbmi2 -DHNI

win32:
	i686-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -DW32_BUILD -msse3 gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)

win32-prof:
	i686-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -DW32_BUILD -msse3 -fprofile-generate gull.cpp -o $(WIN_TARGET)
	wine $(WIN_TARGET) bench
	i686-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -DW32_BUILD -msse3 -fprofile-use gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)

win64:
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)
	
win64-prof:	
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 -fprofile-generate gull.cpp -o $(WIN_TARGET)
	wine $(WIN_TARGET) bench
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 -fprofile-use gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)
	
unix:
	g++ -O3 -g0 -std=c++11 -DUNIX -fno-rtti -static -msse3 gull.cpp -o $(TARGET)
	
winbmi:
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 $(BMI_FLAGS) gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)

winbmi-prof:
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 $(BMI_FLAGS) -fprofile-generate gull.cpp -o $(WIN_TARGET)
	wine $(WIN_TARGET) bench
	x86_64-w64-mingw32-c++-posix -O3 -g0 -std=c++11 -fno-rtti -static -msse3 $(BMI_FLAGS) -fprofile-use gull.cpp -o $(WIN_TARGET)
	@strip $(WIN_TARGET)

clean:
	@rm -f $(WIN_TARGET) $(TARGET) *.cdata
