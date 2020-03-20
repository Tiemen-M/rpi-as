# makefile
progs_gcc:=first sum01 sum02 sum03 load01 store01 
progs_gcc+=branch01 branch02 compare01 loop01 loop02 collatz
progs_gcc+=hello01 printf01 printf02 numericalLabels bsearch
progs_gcc+=rfac predict_collatz VFPv2_PI
progs_ld:=sum04 load02 store02 store03 store04 branch03 addrmodes01 addrmodes02 addrmodes03
progs_ld+=eigen01 syscall

all: $(progs_gcc) $(progs_ld)

.SECONDEXPANSION:
$(progs_gcc): $$@.o
	gcc -o $@ $+

.SECONDEXPANSION:
$(progs_ld): $$@.o
	ld -o $@ $+

%.o: %.s
	as -g -o $@ $^ -mfpu=vfpv2

.PHONY: clean
clean:
	rm -vf $(progs_gcc) $(progs_ld) *.o

