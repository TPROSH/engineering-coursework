clr p3.3
setb p3.4

start:
mov p1,#040h
call delay
mov p1,#0f9h
call delay
mov p1,#0a4h
call delay
mov p1,#0b0h
call delay
mov p1,#099h
call delay
mov p1,#092h
call delay
mov p1,#002h
call delay
mov p1,#0f8h
call delay
mov p1,#000h
call delay
mov p1,#010h
call delay

jmp start

delay:
mov r5,#10h
djnz r5,$
ret
