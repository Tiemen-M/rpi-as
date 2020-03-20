@ syscal.s - print iets via linux
.balign 4
.text
.global _start
_start:
	@ print iets
	mov r7, #4
	mov r0, #1
	ldr r1, =hallo
	mov r2, #17
	swi #20 @ argument wordt niet door linux gebruikt
		@ het kan alles zijn	

	@ exit
	mov r7, #1
	mov r0, #0
	svc #111

.data
hallo:
	.asciz "Hallo, wereld!!!\n"

/*
informatie over linux syscalls:
https://jumpnowtek.com/shellcode/linux-arm-shellcode-part1.html
[10-06-2020-20:58]
*/
