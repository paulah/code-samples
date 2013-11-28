# Project 5 public tests Makefile

CC = gcc
CFLAGS = -ansi -pedantic-errors -Wall -Werror

# create all public tests

all: public01.x public02.x public03.x public04.x public05.x \
     public06.x public07.x public08.x public09.x public10.x

# link object files into executables

public01.x: public01.o fakefile.o split.o
	$(CC) public01.o fakefile.o split.o -o public01.x

public02.x: public02.o fakefile.o split.o
	$(CC) public02.o fakefile.o split.o -o public02.x 

public03.x: public03.o fakefile.o split.o
	$(CC) public03.o fakefile.o split.o -o public03.x

public04.x: public04.o fakefile.o split.o
	$(CC) public04.o fakefile.o split.o -o public04.x

public05.x: public05.o fakefile.o split.o
	$(CC) public05.o fakefile.o split.o memory-checking.o -o public05.x 

public06.x: public06.o fakefile.o split.o
	$(CC) public06.o fakefile.o split.o memory-checking.o -o public06.x 

public07.x: public07.o fakefile.o split.o
	$(CC) public07.o fakefile.o split.o -o public07.x

public08.x: public08.o fakefile.o split.o
	$(CC) public08.o fakefile.o split.o -o public08.x

public09.x: public09.o fakefile.o split.o
	$(CC) fakefile.o public09.o split.o -o public09.x 

public10.x: public10.o fakefile.o
	$(CC) fakefile.o public10.o split.o -o public10.x 

# create object (binary) files

public01.o: public01.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public01.c

public02.o: public02.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public02.c

public03.o: public03.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public03.c

public04.o: public04.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public04.c

public05.o: public05.c fakefile.h fakefile-datastructure.h memory-checking.h
	$(CC) $(CFLAGS) -c public05.c

public06.o: public06.c fakefile.h fakefile-datastructure.h memory-checking.h
	$(CC) $(CFLAGS) -c public06.c

public07.o: public07.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public07.c

public08.o: public07.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public08.c

public09.o: public07.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public09.c

public10.o: public10.c fakefile.h fakefile-datastructure.h
	$(CC) $(CFLAGS) -c public10.c

fakefile.o: fakefile.c fakefile.h fakefile-datastructure.h split.h
	$(CC) $(CFLAGS) -c fakefile.c

clean:
	rm -f file newer_file older_file \
              public01.o public02.o public03.o public04.o public05.o \
              public06.o public07.o public08.o public09.o public10.o \
              public01.x public02.x public03.x public04.x public05.x \
              public06.x public07.x public08.x public09.x public10.x \
              main.x main.o functions.o fakefile.o
