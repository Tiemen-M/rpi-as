@ system.s - ga in systeem mode
.set GPIO, 0x7e200000

.balign 4
.text
.global _start
_start:
	@ ga in systeem mode
	mrs r0, cpsr
	mov r1, r0
	orr r1, r1, #0b11111
	msr cpsr, r1

	@ zet gpio 16 op output
	ldr r2, =GPIO
	ldr r3, [r2, #4]
	mov r5, #1
	mov r4, r5, LSL #18
	orr r3, r4
	str r3, [r2,#4]

	@ zet gpio 16 aan
	mov r3, #1
	mov r3, r3, LSL #16	
	str r3, [r2, #0x1c]

	@ ga uit systeem mode
	msr cpsr, r0

	@ exit
	mov r7, #1
	mov r0, #0
	svc #111
