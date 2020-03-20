@ squares.i

@@ sq(int *i)
@ kwadrateer i
sq:
        ldr r2, [r0]
        ldr r3, [r0]
        mul r1, r2, r3
        str r1, [r0]
        bx lr

@@ int sq_sum5(n1,n2,n3,n4,n5)
@ kwadrateer 5 integers en tel ze op
sq_sum5:
        stmdb sp!, {fp, lr}
        mov fp, sp
        sub sp, sp, #16

        str r0, [fp, #-16]
        str r1, [fp, #-12]
        str r2, [fp, #-8]
        str r3, [fp, #-4]

        sub r0, fp, #16
        bl sq
        sub r0, fp, #12
        bl sq
        sub r0, fp, #8
        bl sq
        sub r0, fp, #4
        bl sq
        add r0, fp, #8
        bl sq

        ldr r0, [fp, #-16]
        ldr r1, [fp, #-12]
        add r0, r0, r1
        ldr r1, [fp, #-8]
        add r0, r0, r1
        ldr r1, [fp, #-4]
        add r0, r0, r1
        ldr r1, [fp, #8]
        add r0, r0, r1

        mov sp, fp
        ldmia sp!, {fp, lr}
        bx lr


        
