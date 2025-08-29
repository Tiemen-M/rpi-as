@ VFPv2_PI.s - test programa VFPv2 coprocessor
@ benader het getal pi door 355/113 uit te rekenen 
.balign 4
.global main
.global printf

.text
@ ---------- hoofd programa
main:
	stmdb sp!, {r4-r12, lr}
	@@ Benader het getal pi	
	@ laad variable a in register D1
	ldr r0, =a
	vldr D1, [r0]

	@ laad variable b in register D2	
	ldr r0, =b
	vldr D2, [r0]

	@ doe D0 <= D1 / D2
	vdiv.f64 D0, D1, D2

	@ print resultaat naar scherm
	bl print

	ldmia sp!, {r4-r12, lr}
	bx lr

@ print() - print de inoud van D0 register
print:
	stmdb sp!, {lr}
	
	@ print D0 register
	ldr r0,=format
	vmov r1,r2, D0
	bl printf

	ldmia sp!, {lr}
	bx lr

.data
format: .asciz "%e\n"
a: .double 355
b: .double 113
