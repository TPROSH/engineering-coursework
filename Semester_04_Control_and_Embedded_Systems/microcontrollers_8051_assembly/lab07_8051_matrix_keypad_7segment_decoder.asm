start:
mov p0,#0ffh
mov p1,#0ffh

lcall row3
lcall row2
lcall row1
lcall row0

sjmp start


row3:
mov p0,#0ffh
mov p1,#0ffh
clr p0.3
jnb p0.4,three
jnb p0.5,two
jnb p0.6,one
jmp row3
one:
mov p1,#0f9h
jb p0.6 , start
jmp one
two:
mov p1,#0a4h
jb p0.5,start
jmp two
three:
mov p1,#0b0h
jb p0.4 , start
jmp three

row2:
mov p0,#0ffh
mov p1,#0ffh
clr p0.2
jnb p0.4,six
jnb p0.5,five
jnb p0.6,four
jmp row2

wait1:
ljmp start

four:
mov p1,#099h
jb p0.6 , start
jmp four
five:
mov p1,#092h
jb p0.5 , start
jmp five
six:
mov p1,#002h
jb p0.4, start
jmp six

row1:
mov p0,#0ffh
mov p1,#0ffh
clr p0.1
jnb p0.4,nine
jnb p0.5,eight
jnb p0.6,seven
jmp row1
seven:
mov p1,#0f8h
jb p0.6 , wait1
jmp seven
eight:
mov p1,#000h
jb p0.5 , wait1
jmp eight
nine:
mov p1,#010h
jb p0.4, wait1
jmp nine

row0:
mov p0,#0ffh
mov p1,#0ffh
clr p0.0
jnb p0.5 , zero
jmp row0
zero:
mov p1,#040h
jb p0.5 , wait1
jmp zero
