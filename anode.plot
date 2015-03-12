reset
set terminal epslatex color
set output 'anode.tex'
set xlabel '$(U_A-U_K)^{1.5}$'
set ylabel 'Imp/s'
set key top left

N(x)=x/(1-10**(-4)*x)
f(x)=m*x+b
g(x)=n*x+c

set fit logfile 'anode.log'

fit f(x) 'anode.csv' u 6:4:($4*0.01) via m,b
fit g(x) 'anode.csv' u 7:5:($5*0.01) via n,c

p 'anode.csv' u 6:4:($4*0.01) w e t'Messwerte K$_\beta$',\
  'anode.csv' u 7:5:($5*0.01) w e t'Messwerte K$_\alpha$',\
  f(x) lt -1 notitle ,g(x) lt -1 notitle

set output
!epstopdf anode.eps
!rm anode.eps
