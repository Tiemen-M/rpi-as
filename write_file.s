@ write_file.s - demostreert het schrijven naar een file
.text
.global _start
_start:
	@@@ file pointer -> r4

	@ maak en open bestand
	mov r7, #5
	ldr r0, =path
	mov r1, #0x142
	mov r2, #0600
	swi #0x0	 	
	mov r4, r0	

	@ print er een bericht naar toe
	mov r7, #4
	mov r0, r4
	ldr r1, =bericht
	mov r2, #(eind-bericht)	
	swi #0x0

	@ sluit bestand
	mov r7, #6
	mov r0, r4
	swi #0x0


	@ keer terug naar linux
	mov r7, #1
	mov r0, #0
	swi #0x0

.data
path: .asciz "write_file.txt"
bericht: .asciz "Dit is een test bestand met een test boodschap.\n"
eind:
