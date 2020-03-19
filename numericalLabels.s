@ --- numericalLabels.s (UAL syntax)
.global main
.syntax unified
.text

main:
	push {r4, lr}
	ldr r0, =message1
	bl puts
	b 1f
	b 2f
1:
	ldr r0, =message2
	bl puts
1:
	mov r0, 43
	pop {r4, pc}
2:
	ldr r0, =errmessage
	bl puts
	b 1b

.data
message1: .asciz "Numerical Label Test\n"
message2: .asciz "Success\n"
errmessage: .asciz "Failure!\n"

.global puts
