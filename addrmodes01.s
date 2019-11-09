@ doel: vergelijken van LSL instuctie alleen en LSL in mov
.balign 4
.global _start

.text
_start:
	mov r0, #33
	LSL r0, #1
stop1:
	mov r0, #33
	mov r0, r0, LSL #1
stop2:
end:
	mov r7, #1
	swi #0
