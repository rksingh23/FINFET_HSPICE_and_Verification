*************************
*  lab3---1X_nor_LP
*************************

.include './hp7nfet.pm'
.include './hp7pfet.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param fin_height=18n 
.param fin_width=7n 
.param lg=11n 
.param number_fin = 1
.param p_fin = 5*number_fin
.param n_fin = 3*number_fin
.param LoadCap = 1f

VSS Gnd 0 'vss'


*add transistors  
mp1 Z1 A X X pfet L=lg NFIN=p_fin
mp2 Z2 B Z1 X pfet L=lg NFIN=p_fin
mn1 Z2 A 0 0 nfet L=lg NFIN=n_fin
mn2 Z2 B 0 0 nfet L=lg NFIN=n_fin

*add cap
Cz Z2 Gnd 'LoadCap'

*add voltage source
VX X 0 'vdd'

VA A 0 PULSE(0 0.7 0 10p 10p 2.2u 4.4u)
VB B 0 PULSE(0 0.7 0 10p 10p 1u 2u)

*define the initial condition of V(Z)
.IC V(Z2)='vdd'

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.1u 20u 

*print the V(Z) to waveform file *.tr0
.print V(Z1)
.print V(Z2)
.print V(X)
.print V(A)
.print V(B)
.print i(Cz)
.print power(Cz)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran t_fall_delay_A TRIG V(A) VAL = 0.35 TD = 1n
+ RISE = 4 TARG V(Z2) VAL = 0.35 FALL = 6

.measure tran t_fall_delay_B TRIG V(B) VAL = 0.35 TD = 1n
+ RISE = 2 TARG V(Z2) VAL = 0.35 FALL = 1

.measure tran t_rise_delay_A TRIG V(A) VAL = 0.35 TD = 1n
+ FALL = 4 TARG V(Z2) VAL = 0.35 RISE = 5

.measure tran t_rise_delay_B TRIG V(B) VAL = 0.35 TD = 1n
+ FALL = 2 TARG V(Z2) VAL = 0.35 RISE = 1

.measure tran t_fall_time TRIG V(Z2) VAL = 0.56 TD = 1n
+ FALL = 2 TARG V(Z2) VAL = 0.14 FALL = 2

.measure tran t_rise_time TRIG V(Z2) VAL = 0.14 TD = 1n
+ RISE = 2 TARG V(Z2) VAL = 0.56 RISE = 2

.measure tran time1 when V(Z2)=0.14
.measure tran time2 when V(Z2)=0.56
.measure tran switching_power AVG p(Cz) from 'time1' to 'time2'
.measure switching_energy param = 'abs(switching_power * (time2-time1))'


.measure tran leakage_current AVG i(mn2) from 1u to 2u
.measure leakage_power param = 'abs(vdd * leakage_current)'

.end
