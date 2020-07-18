@ loopLicht.s - laat een lampje over een rij leds lopen
@ programa gruikt functies uit gpio_lib.i en map.i
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

	@ ga naar loopLicht functie
	mov r0, r4
	bl loopLicht

	@ geef gpio toegang terug
	mov r0, r4
	mov r1, #4096
	bl unmap 
	
	@ exit
	mov r7,#1
	mov r0, #0
	swi #0x0

loopLicht:
	stmdb sp!, {r4-r12, lr}
	gpio .req r10
	loop .req r11
	
	mov gpio, r0

	@ zet alle leds op output	
	mov loop, #(leds_eind-leds)
	ldr r7, =leds

1:	mov r0, gpio
	ldrb r1, [r7], #1
	mov r2, #1
	bl setupPin
	
	mov r0, gpio
	ldrb r1, [r7, #-1]
	mov r2, #1
	bl writePin

	mov r0, #2
	bl busyWait
	
	subs loop, loop, #1
	bgt 1b
	
	@@ loop 50 keer

	@ wacht een seconde	

	@ doe huidige lampje uit	

	@ bepaal welke lampje aan moet

	@ doe nieuwe huidige lampje aan
	
	.unreq gpio
	.unreq loop
	ldmia sp!, {r4-r12, lr}	
	bx lr

.data
@ lijst met de led aansluitingen
leds:
	.byte 21,20,16,12,26,19,13,6,5,11,9,10,7,8,25,24,23
	.byte 18,22,27,17,4,3,2,15,14,0,1
leds_eind:
