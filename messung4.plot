reset
set terminal epslatex color
set output 'messung4.tex'
set xlabel 'Kristallwinkel $\theta$'
set ylabel 'ln(Imp/s)'
set key top right

N(x)=x/(1-10**(-4)*x)

p 'messung4_Cu.txt' u 1:(log(N($2))) t'Kupfer' w lp,\
  'messung4_Ni.txt' u 1:(log(N($2))) t'Nickel' w lp

set output
!epstopdf messung4.eps
!rm messung4.eps
