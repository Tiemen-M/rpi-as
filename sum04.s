/* sum01.s */
.global _start

_start:
	mov r0, #3
	mov r1, #7
	add r0, r0, r1
	
	@exit
	mov r7,#1
	svc 0
