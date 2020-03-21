@ tumb.s - test programa om tumb te demostreren
.global main

.text

@ ---- tub functions
.balign 2
.code 16
test:
	mov r0, #10
	bx lr

.balign 4
.code 32
main:
	stmdb sp!, {lr}
	
	blx test

	ldmia sp!, {lr}
	bx lr

