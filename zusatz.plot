reset
set terminal epslatex color
set output 'zusatz.tex'
set xlabel '$\lambda^3~[\si{10^{-33}\meter^3}]$'
set ylabel '$\frac{\mu}{\rho Z^3}$ $[\si{\meter^2\per\kilo\gram}]$'
set key top left

N(x)=x/(1-10**(-4)*x)

Al_d=0.08
Al_rho=2.7
Al_Z=13
Zn_d=0.025
Zn_rho=7.14
Zn_Z=30
Sn_d=0.025
Sn_rho=7.28
Sn_Z=50

g(x)=a*x+b
h(x)=c*x+d
i(x)=e*x+f

set fit logfile 'zusatz.log'
fit g(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($3))/Al_d/Al_rho/(Al_Z**3)) via a,b
fit h(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($4))/Zn_d/Zn_rho/(Zn_Z**3)) via c,d
fit i(x) 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($5))/Sn_d/Sn_rho/(Sn_Z**3)) via e,f

p 'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($3))/Al_d/Al_rho/(Al_Z**3)) t'Al',\
  'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($4))/Zn_d/Zn_rho/(Zn_Z**3)) t'Zn',\
  'messung5.csv' u ((2*20.1*sin($1/180*pi))**3):(log(N($2)/N($5))/Sn_d/Sn_rho/(Sn_Z**3)) t'Sn',\
  g(x) lt -1 notitle,h(x) lt -1 notitle,i(x) lt -1 notitle

set output
!epstopdf zusatz.eps
!rm zusatz.eps
