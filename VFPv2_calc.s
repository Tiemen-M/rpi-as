@ VFPv2_calc.s - test programa die twee vectors optelt
@ het print het antwoordt in heximaal en niet in float format
@ omdat printf die niet goed kan printen (ik weet niet waarom)
.global main
.global printf
.balign 4
.text
@ --- hoofdprograma
main:	stmdb sp!, {r4-r12, lr}
	
	@ zet fpscr
	vmrs r4, fpscr @ r4 <- fpscr
	mov r5, #7	@ fpscr <- 8<<16
	mov r5, r5, LSL #16  
	orr r5, r4, r5
	vmsr fpscr, r5
	
	@ laad doubles in VFP registers
	ldr r0, =row1
	vldmia r0 ,{s16-s23}	
	ldr r0, =row2
	vldmia r0 ,{s24-s31}	

	@ row1 + row2 = ans
	vadd.f32 s8, s16, s24
	
	@ schrijf ans in ram
	ldr r0, =anslen
	vstmdb r0!, {s8-s15}

	@ herstel fpscr
	vmsr fpscr, r4

	@ print resultaat
	mov r0, #8
	ldr r1, =ans
	bl printListF

	ldmia sp!, {r4-r12, lr}
	bx lr

@@@@@@@@ printListF(n, addr)
@ print een lijst met integers
printListF:
	stmdb sp!, {r4-r12, lr}
	@ setup
	mov r4, r0 	@ i=n
	mov r5, r1	@ *p = addr

1:	@ loop

	@ print volgende nummer
	ldr r0, =uitvoer
	ldr r1, [r5], #+4
	bl printf

	@ end loop	
	subs r4, r4, #1
	bgt 1b	
	
	@ ga naar nieuwe regel
	ldr r0, =newline
	bl printf

	ldmia sp!, {r4-r12, lr}
	bx lr

.data
row1: .float 1.1 ,2.2 ,3.3 ,4.4 ,5.5 ,6.6 ,7.7 ,8.8
row2: .float 8.8 ,7.7 ,6.6 ,5.5 ,4.4 ,3.3 ,2.2 ,1.1
ans: .skip 4*8
anslen:
uitvoer: .asciz "%x, "
newline: .asciz "\n"


