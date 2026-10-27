mov a,#0feh
mov p1,a
call delay

start:rl a
mov p1,a
call delay
mov p1,a
call delay

jmp start

delay:
mov r5,#10h
djnz r5,$
ret