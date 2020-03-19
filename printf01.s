@ -- printf01.s
.data
.balign 4
message1: .asciz "Hey, type a number: "
message2: .asciz "I read the number %d\n"
scan_pattern: .asciz "%d"
number_read: .word 0
return: .word 0

.text
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

	@ geef message2 + gelezen input
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

