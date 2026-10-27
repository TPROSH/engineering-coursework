start:
mov p1,#0ffh
jnb p2.0,zero
jnb p2.1,one
jnb p2.2,two
jnb p2.3,three
jnb p2.4,four
jnb p2.5,five
jnb p2.6,six
jnb p2.7,seven
jmp start

zero:
mov p1,#040h
jb p2.0 , start
jmp zero

one:
mov p1,#0f9h
jb p2.1 , start
jmp one

two:
mov p1,#0a4h
jb p2.2 , start
jmp two

three:
mov p1,#0b0h
jb p2.3 , start
jmp three

four:
mov p1,#099h
jb p2.4 , start
jmp four

five:
mov p1,#092h
jb p2.5 , start
jmp five

six:
mov p1,#002h
jb p2.6, start
jmp six

seven:
mov p1,#0f8h
jb p2.7 , start
jmp seven

