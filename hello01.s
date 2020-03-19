@ -- hello01.s
.data
greeting:
	.asciz "Hello, world"

.balign 4
return: .word 0

.text
.global main
main:
	@ sla address op van aanroeper
	ldr r1, =return
	str lr, [r1]

	@ roep c functie puts aan
	ldr r0, =greeting
	bl puts

	@ herstel lr register
	ldr r1, =return
	ldr lr, [r1]
	bx lr

/* external */
.global puts


