@ rfac.s - recursief faculteit v1.0 (Tiemen Molenaar)
.balign 4
.global main
.global printf
.global scanf
.include "rfac.i"
.text
main:
	stmdb sp!, {r4-r12, lr}
	@ ----- begin main
	@ vraag om input
	ldr r0, =bericht1
	bl printf
	ldr r0, =format1
	ldr r1, =invoer
	bl scanf
	
	@ bereken faculteit
	ldr r0, =invoer
	ldr r0, [r0]
	ldr r1, =product
	bl rfac

	@ print output
	ldr r0, =bericht2
	ldr r1, =invoer
	ldr r1, [r1]
	ldr r2, =product
	ldr r2, [r2]
	bl printf

	@ ----- eind main	
	ldmia sp!, {r4-r12, lr}
	bx lr

.data
bericht1:
	.asciz "Voer een getal in:"
bericht2:
	.asciz "Faculteit %d is %d.\n"
format1:
	.asciz "%d"
invoer:
	.word 0
product:
	.word 1

