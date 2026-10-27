b_s = [2 5 3 6]
a_s = [1 6 11 6]

[r,p,k] = residue(b_s , a_s)
[num , den] = residue(r,p,k)
sys = tf(num , den)