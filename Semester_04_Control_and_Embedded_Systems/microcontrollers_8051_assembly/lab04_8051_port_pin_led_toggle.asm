clr p3.3
setb p3.4

start:
mov p1,#000h
call delay
mov p1,#0ffh
call delay

jmp start

delay:
mov r5,#10h
djnz r5,$
ret
