/* branch01.s */
.text
.global main
main:
	mov r0,#2
	bal end
	mov r0,#3
end:
	bx lr
