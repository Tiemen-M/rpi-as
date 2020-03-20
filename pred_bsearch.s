@ bsearch.s - binary search test

.global main
.data 
@ berichten
.balign 4
bericht1 : .asciz "Typ een nummer in : "
format : .asciz "%d"
bericht2 : .asciz "Nummer %d is op positie %d\n"

@ globale variablen
.balign 4
lijst :	.word 10 ,22 ,32 ,43 ,73 ,99 ,100
min :	.word 0
max :	.word 7
input : .word 0
ans : .word 0

.text
@ ----------- functie bsearch
@ input  : zoek_naar(r0)
@ output : positie(r0)
bsearch:
	@ onthoud waarden die terug gezet moeten worden
	stmdb sp!, {r4-r12,lr}
	
	@ check of het niet negetief is
	cmp r0, #0
	bxlt lr	

	@ zet basiswaarden
	mov r6, r0 	@ zoek waarde
	ldr r7, =lijst 	@ lijst
	ldr r0, =min	@ ondergrens
	ldr r0, [r0]
	ldr r1, =max	@ bovengrens
	ldr r1, [r1]
loop:	
	@ check of zoeken heeft gevaald
	cmp r1, r0
	bxlt lr

	@ bereken index midden
	add r3, r0, r1	@ r8 <= r3 <= (onder + boven) / 2
	mov r3, r3, asr #1
	mov r8, r3

	@ bereken address midden
	add r5, r7, r3, lsl #2 @ r5 <= &lijst + index*4
	
	@ haal midenste elemnt uit gehuigen
	ldr r5, [r5]

	@ bepaal wat er moet gebeuren
	cmp r5, r6	@ test midden-zoek_waarde 		
	
	@ pas ondergrens aan
	addlt r0, r3, #1
	
	@ pas bovengrens aan
	subgt r1, r3, #1
	
	@ ga door met de loop zolang het niet gevonden is
	bne loop

	@ geef index gevonden nummer terug
	mov r0, r8

	@ waarden terug zetten
	ldmia sp!, {r4-r12,lr}	
	bx lr


@ ---------- hoofdprograma
main:
	stmdb sp!, {r4-r12,lr}

	@ geef de gerbuiker een bericht
	ldr r0, =bericht1
	bl printf

	@ lees input gebruiker
	ldr r0, =format
	ldr r1, =input
	bl scanf	
	
	@ roep bsearch functie aam
	ldr r0, =input
	ldr r0, [r0]
	bl bsearch
	ldr r1, =ans
	str r0, [r1]

	@ toon resultaat
	ldr r0, =bericht2
	ldr r1, =input
	ldr r1, [r1]
	ldr r2, =ans
	ldr r2, [r2]
	bl printf

	ldmia sp!, {r4-r12,lr}
	bx lr

.global printf
.global scanf
	
