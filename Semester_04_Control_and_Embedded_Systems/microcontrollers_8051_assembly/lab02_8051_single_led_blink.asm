start:
mov p1,#0feh
call delay
mov p1,#0ffh
call delay

jmp start

delay:
mov r5,#10h
djnz r5,$
ret