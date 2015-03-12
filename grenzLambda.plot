reset
set terminal epslatex color
set output 'grenzLambda.tex'
set xlabel 'Spannung $U_A$ [kV]'
set ylabel '$\lambda_\text{gr}\cdot U_A$ [$10^{-6}~$Vm]'
set key top center
set xrange [22:36]

N(x)=x/(1-10**(-4)*x)
f(x)=a


set fit logfile 'grenzLambda.log'
fit f(x) 'grenzLambda.csv' u 1:($1*$4/1000):($1*$5/1000) via a

p 'grenzLambda.csv' u 1:($1*$4/1000):($1*$5/1000) w e t'Messwerte',\
f(x) lt -1 t'Mittelwert'

set output
!epstopdf grenzLambda.eps
!rm grenzLambda.eps
