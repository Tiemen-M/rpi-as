/* load01.s */
.global main

/* data gedeelte */
.data
.balign 4
myvar1:
	.word 3
.balign 4
myvar2:
	.word 4

/* code gedeelte */
.text
main:
	ldr r1, addr_of_myvar1
	ldr r1, [r1]
	ldr r2, addr_of_myvar2
	ldr r2, [r2]
	add r0, r1, r2
	bx lr

addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2
