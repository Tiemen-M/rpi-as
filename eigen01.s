@ eigen01.s - berkenen faculteit van 6
.balign 4
.global _start

.text
@ -------------------- hoofd programa
_start:
	ldr r0, =input
	ldr r0, [r0]

	@exit
	mov r7,#1
	svc 0



	
.data
input : .word 6
