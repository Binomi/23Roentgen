reset
set terminal epslatex color
set output 'messung2.tex'
set xlabel 'Kristallwinkel $\theta$'
set ylabel 'Imp/s'
set key top right

N(x)=x/(1-10**(-4)*x)

p 'messung2.txt' u 1:(N($2)) t'Messwerte'

set output
!epstopdf messung2.eps
!rm messung2.eps
