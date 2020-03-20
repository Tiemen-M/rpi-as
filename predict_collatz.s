/* predict_collatz.s - collatz berekenjen met predictioon*/
.text
.global main
main:
	mov r1, #123
	mov r2, #0
loop:
	@ bij r1=1 zijn we klaar
	cmp r1, #1
	beq end

	@ check of r1 even is
	and r3, r1, #1
	cmp r3, #0

	@ bereken volgende getal
	moveq r1, r1, ASR #1
	addne r1, r1, r1, LSL #1
	addne r1, r1, #1

	@ hou bij hoeveel getallen we hebben gehad
	add r2, r2, #1
	b loop
end:
	mov r0, r2
	bx lr
