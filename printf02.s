@ -- printf02.s
.data
.balign 4
message1: .asciz "Hey, type a number: "
message2: .asciz "%d times 5 is %d\n"
scan_pattern: .asciz "%d"
number_read: .word 0
return: .word 0
return2: .word 0

.text
mult_by_5:
	@ onthoud adress aanroeper
	ldr r1, =return2
	str lr, [r1, #0]

	@ doe berekening
	add r0, r0, r0, LSL #2

	@ ga naar aanroeper
	ldr lr, =return2
	ldr lr, [lr, #0]
	bx lr

.global main
main:
	@ sla adress op van oproeper
	ldr r1, =return
	str lr, [r1]

	@ print message1
	ldr r0, =message1
	bl printf

	@ lees input
	ldr r0, =scan_pattern
	ldr r1, =number_read
	bl scanf

	@ roep mult_by_5 functie aan
	ldr r0, =number_read
	ldr r0, [r0]
	bl mult_by_5

	@ geef message2 + gelezen input + input*5
	mov r2, r0
	ldr r0, =message2
	ldr r1, =number_read
	ldr r1, [r1]
	bl printf

	@ geef de ingevoerde waarde als error code terug
	ldr r0, =number_read
	ldr r0, [r0]
	
	@ herstel lr met het adress van de aanroeper van de hoofdprograma
	ldr lr, =return
	ldr lr, [lr]
	bx lr
.global printf
.global scanf
