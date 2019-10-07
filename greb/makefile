# set a variable to represent the compiler
CC = g++
LC_MESSAGES=C
CFLAGS=-g -Wall
AGGRO_CFLAGS = -g -Wall -Ofast -mssse3 -mfpmath=both -pipe -funroll-loops -flto=8 -fgraphite-identity -floop-nest-optimize -malign-data=cacheline -mtls-dialect=gnu2 -Wl,--hash-style=gnu
:
# target name variable
TARGET = greb
ATARGET = greb-aggro

# file extension
FILEXT = cpp

# the build target executable => install path of the executable
PREFIX = /usr/local
DESTDIR = /home/bernd/staging/


# basic makefile format
# name of instruction: dependencies
# <tab> command to execute
# the FIRST one you list is the default
$(TARGET): $(TARGET).$(FILEXT)
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).$(FILEXT)

.PHONY: aggro
aggro: $(TARGET).$(FILEXT)
	$(CC) $(AGGRO_CFLAGS) -o $(ATARGET) $(TARGET).$(FILEXT)

.PHONY: all
all: $(TARGET).$(FILEXT)
	$(CC) $(MAKEOPTS) $(CFLAGS) -o $(TARGET) $(TARGET).$(FILEXT)

.PHONY: clean
clean:
	rm $(TARGET)

.PHONY: install
install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/$<
