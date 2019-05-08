print("Hello World")

var('mu chi b k')

eq1 = 2*mu+k*chi == 0
eq2 = 4*b*k+k*chi^2 == 0
eq3 = -2*b*mu+3*b*k*chi == 0

solve([eq1, eq2, eq3], mu, chi, b)




# first make a list of the variables
l = 3
mu = list(var('mu%d' % i) for i in range(l-1))
sage: w = list(var('w_%d' % i) for i in range(2*n))
sage: s
[s_0, s_1, s_2, s_3, s_4, s_5]
sage: w
[w_0, w_1, w_2, w_3, w_4, w_5]
sage: 
sage: # then make a list of equations
sage: eqs = list(w[k] == s[2*n-k-1] for k in range(2*n))
sage: eqs
[w_0 == s_5, w_1 == s_4, w_2 == s_3, w_3 == s_2, w_4 == s_1, w_5 == s_0]



# eq_1 = 2*b*l*k + sum(xx[l+s-1]*(s*mm[l-s-1] + k*(l-s)*xx[l-s-1]/2) , s, -l+1, l-1) #error

#пока чётный случай

l = 1

#var('b k')

var('b')

mm = list(var('m_%d' % i) for i in range(1, 2*l))
xx = list(var('x_%d' % i) for i in range(1, 2*l))
eqeq = list(var('eq_%d' % i) for i in range(1, 2*l))


eqsmid = 2*b*l*k + sum([xx[l+s-1]*(s*mm[l-s-1] + k*(l-s)*xx[l-s-1]/2) for s in range(-l+1, l) ]) == 0

eqsupper = list( l*mm[l+j-1] + xx[l+j-1]*k*(l-j)/2 + sum([xx[l+s-1]*(j*mm[2*l+j-s-1] + k*(l-s)*xx[2*l+j-s-1]/2) for s in range(max(j+1, -l+1), min(2*l+j, l)) ]) == 0 for j in range(-l+1, l) )	

eqslower = list( -b*l*mm[l+j-1] + b*k*(3*l+j)*xx[l+j-1]/2 + sum([xx[l+s-1]*(j*mm[j-s-1] + k*(l-s)*xx[j-s-1]/2) for s in range(max(-2*l+j+1, -l+1), min(j, l)) ]) == 0 for j in range(-l+1, l) )

solve([eqsmid]+eqsupper+eqslower, xx + mm + [b])
