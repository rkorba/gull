.PHONY: clean win unix
	
BIN=./bin/
TARGET = gull
WIN_TARGET = gull.exe

BMI_FLAGS := -mbmi -mbmi2 -DHNI

win:	$(BIN)%
	x86_64-w64-mingw32-c++ -O3 -g0 -std=c++11 -fno-rtti -static -fno-exceptions -msse3 gull.cpp -o bin/$(WIN_TARGET)
	
unix:
	g++ -O3 -g0 -std=c++11 -DUNIX -fno-rtti -static -fno-exceptions -msse3 gull.cpp -o bin/$(TARGET)
	
winbmi:
	x86_64-w64-mingw32-c++ -O3 -g0 -std=c++11 -fno-rtti -static -fno-exceptions -msse3 $(BMI_FLAGS) gull.cpp -o bin/$(WIN_TARGET)

clean:
	rm -f bin/$(WIN_TARGET) bin/$(TARGET)
