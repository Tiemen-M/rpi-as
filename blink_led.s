.include "map.i"
.global _start
.balign 4
.code 32
.text
_start:
	@ verkrijg toegang gpio
	ldr r0, =0x3f200000
	mov r1, #4096
	bl map	
	mov r4, r0 @ r4 -> map_adr

	@ laat led blinken
	mov r0, r4
	bl blink

	@ geef gpio toegang terug
	mov r0, r4
	mov r1, #4096
	bl unmap 
	
	@ exit
	mov r7,#1
	mov r0, #0
	swi #0x0

blink:
	stmdb sp!, {r4-r12, lr}

	@ copy gpio base
	mov r10, r0

	@------ begin loop 6 keer
	mov r5, #10
1:		
	@ zet gpio 16 op output
	mov r0, #1
	lsl r0, #18
	str r0, [r10,#4]	

	@ zet gpio 16 aan
	mov r0, #1
	lsl r0, #16
	str r0, [r10, #0x1c]

	@ wacht 1 seconde
	ldr r4, =#900000000
2:	subs r4, r4, #1
	bne 2b	

	@ zet gpio 16 uit
	mov r0, #1
	lsl r0, #16
	str r0, [r10, #0x28]	

	@ wacht 1 seconde
	ldr r4, =#900000000
3:	subs r4, r4, #1
	bne 3b	
	
	@----- eind loop 6 keer
	subs r5, r5, #1
	bne 1b	

	ldmia sp!, {r4-r12, lr}
	bx lr

