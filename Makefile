# makefile
all: first sum01 sum02 sum03 sum04 load01 store01 branch01 compare01 loop01 loop02 collatz

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

sum03: sum03.o
	gcc -o $@ $+

sum03.o: sum03.s
	as -o $@ $<

sum04: sum04.o
	ld -o $@ $+

sum04.o: sum04.s
	as -o $@ $<

load01: load01.o
	gcc -o $@ $+

load01.o: load01.s
	as -o $@ $<

store01: store01.o
	gcc -o $@ $+

store01.o: store01.s
	as -o $@ $<

branch01: branch01.o
	gcc -o $@ $+

branch01.o: branch01.s
	as -o $@ $<

compare01: compare01.o
	gcc -o $@ $+

compare01.o: compare01.s
	as -o $@ $<

loop01: loop01.o
	gcc -o $@ $+

loop01.o: loop01.s
	as -o $@ $<

loop02: loop02.o
	gcc -o $@ $+

loop02.o: loop02.s
	as -o $@ $<

collatz: collatz.o
	gcc -o $@ $+

collatz.o: collatz.s
	as -o $@ $<


clean:
	rm -vf first sum01 sum02 sum03 sum04 load01 store01 branch01 compare01 loop01 loop02 collatz *.o

