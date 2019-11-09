@ -- spelen met branches en condities
.balign 4
.global _start

.text
_start:
	@ load
	ldr r1, =a   @ r1 = &a
	ldr r2, =b   @ r2 = &b

	ldr r1, [r1] @ r1 = *r1
	ldr r2, [r2] @ r2 = *r2
	
	@ comapre
	cmp r1, r2
	blt case_2
	
case_1:
	mov r0, r1
	bal exit

case_2:
	mov r0, r2

exit:
	@ exit
	mov r7, #1
	swi #0


.data
a:
	.word 6
b:
	.word 22
