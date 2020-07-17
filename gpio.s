@ gpio.s - bestuur de gpio pinnen met intrupts
.code 32
.text
.global _start
_start:
	@ map gpio registers
	bl map

	@ manipuleer gpio registers
	bl led

	@ exit return 0
	mov r7, #1
	mov r0, #0
	swi #0

@ map -> onder adress van map gpio registers
@ mapt de gpio registers zodat we er bij kunnen
map:
	stmdb sp!, {r4-r12, lr}
	
	@ open /dev/mem
	mov r7, #5
	ldr r0, =mem
	ldr r1, =#0x101042 @ sync+write+read
	swi #0
	mov r10, r0 @ file pointer

	@ Als openen is mislukt
	cmp r10, #0
	movlt r0, #1
	ldrlt r1, =error1
	movlt r2, #(error1e-error1)
	movlt r7, #4
	swilt #0
	movlt r0, #0
	blt 1f
	
	@ map gpio registers
	mov r7, #192
	mov r0, #0
	mov r1, #4096
	mov r2, #3 
	mov r3, #1
	mov r4, r10
	ldr r5, =gpio_base
	ldr r5, [r5]
	swi #0
	mov r11, r0 @ onthoud pointer van map
	
	@ als het mapen is fout gegaan
	cmp r11, #0xffffffff
	moveq r0, #1
	ldreq r1, =error2
	moveq r2, #(error2e-error2)
	moveq r7, #4
	swieq #0
	moveq r0, #0
	beq 1f

	@ close /dev/mem
	mov r7, #6
	mov r0, r4
	swi #0

	@ return pointer van map
	mov r0, r11
1:
	ldmia sp!, {r4-r12, lr}
	bx lr

@@ void led(gpio_addr) 
@ zet een GPIO pin op output en 
@ doe die aan zodat er een led brandt
led:
	stmdb sp!, {r4-r12, lr}

	@ copy gpio base
	mov r10, r0
		
	@ zet gpio 16 op output
	mov r0, #1
	lsl r0, #18
	str r0, [r10,#4]	

	@ zet gpio 16 aan
	mov r0, #1
	lsl r0, #16
	str r0, [r10, #0x1c]

	ldmia sp!, {r4-r12, lr}
	bx lr


.data
mem: .asciz "/dev/mem"
error1: .ascii "Kan /dev/mem niet openen!\n"
error1e:
error2: .ascii "Fout opgetreden bij het mappen!\n"
error2e:
mmap_arg: .int 4096, 3, 1, 10, 0x3f200000
gpio_base: .word 0x3f200
 
