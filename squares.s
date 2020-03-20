@ squares.s
.balign 4
.global main
.global printf

.text
.include "squares.i"
main:
	stmdb sp!, {r4, lr}
	
	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	mov r4, #5
	sub sp, sp, #8
	str r4, [sp]
	bl sq_sum5
	add sp, sp, #8
	
	mov r1, r0
	ldr r0, =message
	bl printf

	ldmia sp!, {r4, lr}
	bx lr

.data
message: .asciz "\n Sum of 1^2 + 2^2 + 3^2 + 4^2 + 5^2 is %d\n"
