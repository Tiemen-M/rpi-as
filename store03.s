/* store03.s - verslimpeling van store02.s */
.balign 4
.global _start
.text
_start:
	@ ---- sla gegevens op in memory
	@ -- opslaan waarden in var1 var2 en var3
	ldr r1, =myvar1
	mov r2, #3
	str r2, [r1]

	ldr r1, =myvar2
	mov r2, #4
	str r2, [r1]

	ldr r1, =myvar3
	mov r2, #30
	str r2, [r1]

	@ ---- lees in en bereken
	@ -- laad myvar1
	ldr r1, =myvar1
	ldr r1, [r1]

	@ -- laad myvar2
	ldr r2, =myvar2
	ldr r2, [r2]

	@ -- laad myvar3
	ldr r3, =myvar3
	ldr r3, [r3]

	@ -- tel op
	add r0, r1, r2
	add r0, r0, r3

	@ -- besturing terug geven aan systeem
	mov r7, #1
	swi #0

.data
myvar1:
	.word 0
myvar2:
	.word 0
myvar3:
	.word 0

