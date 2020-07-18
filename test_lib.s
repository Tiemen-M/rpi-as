@include "map.i" wordt nu gelinkt dus dit is overbodig
@include "gpio.i"
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

	@ zet gpio 16 aan
	mov r0, r10
	mov r1, #16
	mov r2, #1
	bl setupPin

	@------ begin loop 6 keer
	mov r5, #10
1:			
	@ zet gpio 16 aan
	mov r0, r10
	mov r1, #16
	mov r2, #1
	bl writePin

	@ wacht 1 seconde
	mov r0, #1
	bl busyWait	
		
	@ zet gpio 16 uit
	mov r0, r10
	mov r1, #16
	mov r2, #0
	bl writePin	

	@ wacht 1 seconde
	mov r0, #1
	bl busyWait
	
	@----- eind loop 6 keer
	subs r5, r5, #1
	bne 1b	

	ldmia sp!, {r4-r12, lr}
	bx lr

