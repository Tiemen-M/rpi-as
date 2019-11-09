@ doel: begin met 1 en tel steeds zichzelf met een steedts oplopende shift op
.balign 4
.global _start

.text
_start:
	@ -- setup
	mov r0, #1
	mov r1, #1
loop:   @ -- loop
	@ - add
	mov r2, #1
	add r0, r0, r2, LSL r1	

	@ - r1++
	add r1, r1, #1

	@ - if e1 > 32 then end	
	cmp r1, #32
	bgt end

	bal loop
end:
	mov r7, #1
	swi #0 
