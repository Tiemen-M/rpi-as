@ paralel_calc.s - bereken 8 sommen tegelijk
.balign 4
.global main
.global printf
.global scanf

.text
@@@@@@@@ hoofdprograma
main:
	stmdb sp!, {r4-r12, lr}
	
	@ welkom scherm
	ldr r0, =welkom
	bl printf

	@ vraag om input en sla het op
	mov r0, #7
	ldr r1, =a
	ldr r2, =b
	bl input

	@ print lijst a
	ldr r0, =lijsta
	bl printf
	
	mov r0, #8
	ldr r1, =a
	bl printListDec

	@ print lijst a
	ldr r0, =lijstb
	bl printf
	
	mov r0, #8
	ldr r1, =b
	bl printListDec

	ldmia sp!, {r4-r12, lr}
	bx lr

@@@@@@@@ input(n, adr_a,adr_b) : void
@ vraagt input en sla het op
input:
	stmdb sp!, {r4-r6,lr}

	@ beginwaarden
	mov r4, r0	
	mov r5, r1
	mov r6, r2

	@ vertel wat er moet gebueren aan gebruiker
	ldr r0, =instuctie
	bl printf

1:	@ loop
	@ vraag input a
	ldr r0, =invoera
	mov r1, r4
	bl printf

	ldr r0, =format
	mov r1, r5
	add r5, r5, #4
	bl scanf 
	
	@ vraag input b			
	ldr r0, =invoerb
	mov r1, r4
	bl printf

	ldr r0, =format
	mov r1, r6
	add r6, r6, #4
	bl scanf 
	
	@ end loop
	subs r4, r4, #1
	bge 1b

	ldmia sp!, {r4-r6,lr}
	bx lr

@@@@@@@@ printListDec(n, addr)
@ print een lijst met integers
printListDec:
	stmdb sp!, {r4-r12, lr}
	@ setup
	mov r4, r0 	@ i=n
	mov r5, r1	@ *p = addr

1:	@ loop

	@ print volgende nummer
	ldr r0, =uitvoer
	ldr r1, [r5], #+4
	bl printf

	@ end loop	
	subs r4, r4, #1
	bgt 1b	
	
	@ ga naar nieuwe regel
	ldr r0, =newline
	bl printf

	ldmia sp!, {r4-r12, lr}
	bx lr

.data
welkom: .asciz "--- buffer test v1.0 ---\n"
format: .asciz "%d"
instuctie: .asciz "na -> buff a, nb -> buf b\n"
invoera: .asciz "%da="
invoerb: .asciz "%db="
uitvoer: .asciz "%d, "
newline: .asciz "\n"
lijsta: .asciz "--- buffer a ---\n"
lijstb: .asciz "--- buffer b ---\n"
a: .skip 32
b: .skip 32
c: .skip 32
