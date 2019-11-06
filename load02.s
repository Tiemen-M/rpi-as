/* load02.s */
.balign 4
.global _start

.text
_start:
	@ -- laad myvar1
	ldr r1, addr_var1
	ldr r1, [r1]

	@ -- laad myvar2
	ldr r2, addr_var2
	ldr r2, [r2]

	@ -- laad myvar3
	ldr r3, addr_var3
	ldr r3, [r3]

	@ -- tel op
	add r0, r1, r2
	add r0, r0, r3

	@ -- besturing terug geven aan systeem
	mov r7, #1
	swi #0

addr_var1: .word myvar1
addr_var2: .word myvar2
addr_var3: .word myvar3

.data
myvar1:
	.word 3
myvar2:
	.word 4
myvar3:
	.word 30
