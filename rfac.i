.text
@ functie: rfac
@ input: (r0 n) (r1 addres product)
@ output: (r0 0)
@ deze functie werkt6 goed als n <= 12 is
rfac:
        stmdb sp!, {r4-r12, lr}
        @ --- begin rfac
        @ bereken pruduct=pruduct*n
        ldr r4, [r1]
        mul r5, r4, r0
        str r5, [r1]

        @ n=n-1
        sub r0, r0, #1
        
        @ als n>0 dan roep rfac aan
        cmp r0, #0
        blgt rfac

        @ --- eind rfac
        ldmia sp!, {r4-r12, lr}
        bx lr
