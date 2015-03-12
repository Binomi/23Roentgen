reset
set terminal epslatex color
set output 'messung5.tex'
set xlabel 'Kristallwinkel $\theta$'
set ylabel 'Imp/s'
set key top left

set xrange [7:17]
set yrange [*:170]

N(x)=x/(1-10**(-4)*x)

p 'messung5.csv' u 1:(N($2)) t'ohne Absorber' w lp,\
'messung5.csv' u 1:(N($3)) t'$0.08~$ mm Al' w lp,\
'messung5.csv' u 1:(N($4)) t'$0.025~$ mm Zn' w lp,\
'messung5.csv' u 1:(N($5)) t'$0.025~$ mm Sn' w lp,\

set output
!epstopdf messung5.eps
!rm messung5.eps

#=====================================================

reset
set terminal epslatex color
set output 'messung6.tex'
set xlabel '$\lambda^3~[\si{10^{-33}\meter^3}]$'
set ylabel '$\frac{\mu}{\rho}$ $[\si{\meter^2\per\kilo\gram}]$'
set key top left

N(x)=x/(1-10**(-4)*x)

Al_d=0.08
Al_rho=2.7
Zn_d=0.025
Zn_rho=7.14
Sn_d=0.025
Sn_rho=7.28

g(x)=a*x+b
h(x)=c*x+d
i(x)=e*x+f

set fit logfile 'messung6.log'
fit g(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($3))/Al_d/Al_rho) via a,b
fit h(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($4))/Zn_d/Zn_rho) via c,d
fit i(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($5))/Sn_d/Sn_rho) via e,f

p 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($3))/Al_d/Al_rho) t'Al',\
  'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($4))/Zn_d/Zn_rho) t'Zn',\
  'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($5))/Sn_d/Sn_rho) t'Sn',\
  g(x) lt -1 notitle,h(x) lt -1 notitle,i(x) lt -1 notitle

#stats 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($5))/Al_d/Al_rho)

set output
!epstopdf messung6.eps
!rm messung6.eps
