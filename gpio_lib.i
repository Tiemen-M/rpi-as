@ gpio.i - gpio library made by Tiemen Molenaar in 2020 july
.code 32
.balign 4
.text

@@@@@ setupPin - stelt de mode van een pin in
@ input: gpio_addr pin_nr mode
@ output: status 
.global setupPin
setupPin:
        stmdb sp!, {r4-r12, lr}
        gpio_addr .req r10
        pin_nr .req r11
        mode .req r12
        mov gpio_addr, r0
        mov pin_nr, r1
        mov mode, r2

        @ check input (0 <= pin_nr < 54 and 0 <= mode < 5)
        cmp pin_nr, #54 @ pin_nr >= 54 anders return 1
        movge r0, #1
        bge 2f
        cmp mode, #5 @ mode >= 5 anders return 1
        movge r0, #1
        bge 2f

        @ bereken gpio function selection register adress
        mov r0, pin_nr  @ berkenen welke bank
        mov r1, #0
1:      cmp r0, #10
        subge r0, r0, #10
        addge r1, r1, #1
        bgt 1b
        mov r1, r1, lsl #2 @ berkenen bank adress

        @ bereken bit positie van pin
        add r0, r0, r0, lsl #1 @ pos=r0<<1+r0
 
        @ modificeer register met nieuwe mode
        mov r3, mode @ schuif de nieuwe mode naar goede plek
        lsl r3, r0
        mov r4, #0b111 @ maak een masker
        lsl r4, r0
        ldr r5, [gpio_addr, r1] @ haal register op
        and r4, r5, r4 @ clear oude mode
        orr r3, r3, r4 @ set nieuwe mode
        
        @ stel pin in
        str r3, [gpio_addr, r1]     
        
        @ return success
        mov r0, #0

        .unreq gpio_addr
        .unreq pin_nr
        .unreq mode
2:      ldmia sp!, {r4-r12, lr}
        bx lr

@@@@@ writePin - Zet pin aan of uit
@ input: gpio_addr pin_nr High_low
@ output: status
@@ werking
@ Eerst worden de argumenten gecheckt, vervolgens wordt er bepaald
@ naar welke adress geschreven moet worden en vervolgens wordt de
@ te beschrijven bit in de goede positie ge shift en naar die
@ gpio register geschreven.
@@@
.global writePin
writePin:
        stmdb sp!, {r4-r12, lr}
        
        gpio_addr .req r10
        pin_nr .req r11
        high_low .req r12
        mov gpio_addr, r0
        mov pin_nr, r1
        mov high_low, r2

        @ check 0 <= pin_nr < 54
        cmp pin_nr, #0
        movlt r0, #1
        blt 1f
        cmp pin_nr, #54
        movge r0, #2
        bge 1f

        @ bepaald of we naar set of clear register moeten schrijven
        cmp high_low, #1
        addeq r5, gpio_addr, #0x1c
        addne r5, gpio_addr, #0x28        
 
        @ bepaal welke register we moeten schrijven en naar welke bit
        cmp pin_nr, #31
        movle r4, pin_nr 
        subgt r4, pin_nr, #31
        addgt r5, r5, #0x4

        @ shift high_low naar de goede plek
        mov r6, #1
        lsl r6, r4

        @ schrijf naar register
        str r6, [r5]

        @ return dat alles is goed gegaan
        mov r0, #0

        .unreq gpio_addr
        .unreq pin_nr
        .unreq high_low
1:        
        ldmia sp!, {r4-r12, lr}
        bx lr

@@@@@ busyWait - wacht ongeveer een seconde door niets te doen
@ input: seconds
@ output:
@@ werking
@ Er wordt een loop gebruikt om te wachten
@@@
.global busyWait
busyWait:
        @ verbeter input zo nodig
        cmp r0, #1
        movlt r0, #1
        
        @ bepaal tijd
        ldr r1, =#900000000
        mul r1, r0, r1

        @ wacht een aantal seconden
1:      subs r1, r1, #1
        bne 1b

        bx lr
