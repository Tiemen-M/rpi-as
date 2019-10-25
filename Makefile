# makefile
all: first sum01 sum02

first: first.o
	gcc -o $@ $+

first.o: first.s
	as -o $@ #<


sum01: sum01.o
	gcc -o $@ $+

sum01.0: sum01.s
	as -o $@ #<

sum02: sum02.o
	gcc -o $@ $+

sum02.0: sum02.s
	as -o $@ #<

clean:
	rm -vf first sum01  *.o

