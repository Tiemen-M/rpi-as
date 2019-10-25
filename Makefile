# makefile
all: first sum01 sum02 load01 store01

first: first.o
	gcc -o $@ $+

first.o: first.s
	as -o $@ #<


sum01: sum01.o
	gcc -o $@ $+

sum01.o: sum01.s
	as -o $@ #<

sum02: sum02.o
	gcc -o $@ $+

sum02.o: sum02.s
	as -o $@ #<

load01: load01.o
	gcc -o $@ $+

load01.o: load01.s
	as -o $@ $<

store01: store01.o
	gcc -o $@ $+

store01.o: store01.s
	as -o $@ $<

clean:
	rm -vf first sum01 sum02 load01 store01  *.o

