#k is even

l = 3

var('b k')

mm = list(var('m_%d' % i) for i in range(1, 2*l))
xx = list(var('x_%d' % i) for i in range(1, 2*l))
eqeq = list(var('eq_%d' % i) for i in range(1, 2*l))


eqsmid = 2*b*l*k + sum([xx[l+s-1]*(s*mm[l-s-1] + k*(l-s)*xx[l-s-1]/2) for s in range(-l+1, l) ]) == 0

eqsupper = list( l*mm[l+j-1] + xx[l+j-1]*k*(l-j)/2 + sum([xx[l+s-1]*(j*mm[2*l+j-s-1] + k*(l-s)*xx[2*l+j-s-1]/2) for s in range(max(j+1, -l+1), min(2*l+j, l)) ]) == 0 for j in range(-l+1, l) )	

eqslower = list( -b*l*mm[l+j-1] + b*k*(3*l+j)*xx[l+j-1]/2 + sum([xx[l+s-1]*(j*mm[j-s-1] + k*(l-s)*xx[j-s-1]/2) for s in range(max(-2*l+j+1, -l+1), min(j, l)) ]) == 0 for j in range(-l+1, l) )

solve([eqsmid]+eqsupper+eqslower, xx + mm + [b])
