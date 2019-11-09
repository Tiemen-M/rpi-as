@ doel:  for(r0=1,r1=1; r1 <= 8; r1++) r0 += (r0<<r1);
.balign 4
.global _start

.text
_start:
	mov r0, #1
	mov r1, #1
loop:
	add r0, r0, r0 , LSL r1
	add r1, r1, #1
	cmp r1, #8
	bgt end
	b loop
end:
	mov r7, #1
	swi #0
