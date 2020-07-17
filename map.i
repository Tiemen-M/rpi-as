@ map en unmap 1.0 - Tiemen Molenaar 2020 juli
.balign 4
.text
.code 32

@@@@@@ map - Geeft toegang tot een bepaald adress in geheugen
@ input: phy_offset_addr length
@ output: map_addr
@ error output: 0x0
@ localvar: reg(phy_offset_addr(r8) length(r9)
@           reg(file_pointer(r10) map_pointer(r11))
map:
        stmdb sp!, {r4-r12, lr}

	@ verwerk argumenten
	mov r8, r0, lsr #12 @ verplaats en omzetten maat page enheid
	mov r9, r1

        @ open /dev/mem
        mov r7, #5
        ldr r0, =mem
        ldr r1, =#0x101042 @ sync+write+read
        swi #0
        mov r10, r0 @ file pointer

        @ Als openen is mislukt
        cmp r10, #0
        movlt r0, #1
        ldrlt r1, =map_error1
        movlt r2, #(map_error1e-map_error1)
        movlt r7, #4
        swilt #0
        movlt r0, #0
        blt 1f

        @ map gpio registers
        mov r7, #192
        mov r0, #0
        mov r1, r9
        mov r2, #3
        mov r3, #1
        mov r4, r10
        mov r5, r8
        swi #0
        mov r11, r0 @ onthoud pointer van map

        @ als het mapen is fout gegaan
        cmp r11, #0xffffffff
        moveq r0, #1
        ldreq r1, =map_error2
        moveq r2, #(map_error2e-map_error2)
        moveq r7, #4
        swieq #0
        moveq r0, #0
        beq 1f

        @ close /dev/mem
        mov r7, #6
        mov r0, r4
        swi #0

	@ return map_addr
	mov r0, r11
1:
	ldmia sp!, {r4-r12, lr}
	bx lr

@@@@@ unmap - geeft de gemapte gehuigen vrij
@ input: map_addr length
unmap:
	@ aanroepen munmap syscall
	mov r7, #91
	swi #0x0

	bx lr


.data
mem: .asciz "/dev/mem"
map_error1: .asciz "Kan /dev/mem niet openen!\n"
map_error1e:
map_error2: .asciz "Kan geen map van memory maken!\n"
map_error2e:
