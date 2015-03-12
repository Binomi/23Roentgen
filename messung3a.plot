reset
set terminal epslatex color
set output 'messung3a.tex'
set xlabel 'Kristallwinkel $\theta$'
set ylabel 'Imp/s'
set key top center

N(x)=x/(1-10**(-4)*x)

p 'messung3a.txt' u 1:(N($2)) t'$U_A=23\,$kV',\
'messung3a.txt' u 1:(N($3)) t'$U_A=26\,$kV' ,\
'messung3a.txt' u 1:(N($4)) t'$U_A=29\,$kV' ,\
'messung3a.txt' u 1:(N($5)) t'$U_A=32\,$kV' ,\
'messung3a.txt' u 1:(N($6)) t'$U_A=35\,$kV' 

set output
!epstopdf messung3a.eps
!rm messung3a.eps
