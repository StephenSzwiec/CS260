#I pray to Sanic the Hedgehog for the speed I need
FAST = MAKEOPTS="-j8"
# set a variable to represent the compiler
CC = g++
#variable for cflags
CFLAGS = -march=native -pipe
#target variable
TARGET = pwn
#prevent gcc from being an idiot
FS = -lstdc++fs

# file extension
FILEXT = cpp

# the build target executable => install path of the executable
PREFIX = /usr/local/bin/
DESTDIR = ~/staging/


# basic makefile format
# name of instruction: dependencies
# <tab> command to execute
# the FIRST one you list is the default
$(TARGET): $(TARGET).$(FILEXT)
	$(FAST) $(CC) $(CFLAGS) -o $(TARGET) $(TARGET).$(FILEXT) $(FS)

.PHONY: all
all: $(TARGET).$(FILEXT)
	$(FAST)	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).$(FILEXT) $(FS)

.PHONY: clean
clean:
	rm $(TARGET)

.PHONY: install
install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/$<
