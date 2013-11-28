CFLAGS = -Wall -ansi -pedantic-errors -Werror

all: public1.x public2.x public3.x public4.x public5.x public6.x public7.x \
mergetest.x

public1.x: public1.o mergesort.o
	gcc -lpthread public1.o mergesort.o -o public1.x

public2.x: public2.o mergesort.o
	gcc -lpthread public2.o mergesort.o -o public2.x

public3.x: public3.o mergesort.o
	gcc -lpthread public3.o mergesort.o -o public3.x

public4.x: public4.o mergesort.o
	gcc -lpthread public4.o mergesort.o -o public4.x

public5.x: public5.o mergesort.o
	gcc -lpthread public5.o mergesort.o -o public5.x

public6.x: public6.o mergesort.o
	gcc -lpthread public6.o mergesort.o -o public6.x

public7.x: public7.o mergesort.o
	gcc -lpthread public7.o mergesort.o -o public7.x

mergetest.x: mergetest.o mergesort.o
	gcc -lpthread mergetest.o mergesort.o -o mergetest.x

public1.o: public1.c mergesort.h
	gcc $(CFLAGS) -c public1.c

public2.o: public2.c mergesort.h
	gcc $(CFLAGS) -c public2.c

public3.o: public3.c mergesort.h
	gcc $(CFLAGS) -c public3.c

public4.o: public4.c mergesort.h
	gcc $(CFLAGS) -c public4.c

public5.o: public5.c mergesort.h
	gcc $(CFLAGS) -c public5.c

public6.o: public6.c mergesort.h
	gcc $(CFLAGS) -c public6.c

public7.o: public7.c mergesort.h
	gcc $(CFLAGS) -c public7.c

mergetest.o: mergetest.c mergesort.h
	gcc $(CFLAGS) -c mergetest.c

mergesort.o: mergesort.c mergesort.h
	gcc $(CFLAGS) -c mergesort.c

clean:
	rm *.o *.x
