*************************
*  lab3---1Bit_Full_Adder
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
.param p_fin = 1*number_fin
.param n_fin = 1*number_fin
.param LoadCap = 1f

VSS Gnd 0 'vss'


*add transistors  
mp1 Z1 A X A pfet L=lg NFIN=p_fin
mp2 Z1 B X B pfet L=lg NFIN=p_fin
mp3 Z3 C Z1 C pfet L=lg NFIN=p_fin
mp4 Z3 B Z2 B pfet L=lg NFIN=p_fin
mp5 Z2 A X A pfet L=lg NFIN=p_fin

mn1 Z3 C Z5 C nfet L=lg NFIN=n_fin
mn2 Z3 B Z4 B nfet L=lg NFIN=n_fin
mn3 Z5 A 0 A nfet L=lg NFIN=n_fin
mn4 Z5 B 0 B nfet L=lg NFIN=n_fin
mn5 Z4 A 0 A nfet L=lg NFIN=n_fin

mp6 Z6 Z3 Z8 Z3 pfet L=lg NFIN=p_fin
mp7 Z8 A X A pfet L=lg NFIN=p_fin
mp8 Z8 B X B pfet L=lg NFIN=p_fin
mp9 Z8 C X C pfet L=lg NFIN=p_fin
mp10 Z12 A X A pfet L=lg NFIN=p_fin
mp11 Z11 B Z12 B pfet L=lg NFIN=p_fin
mp12 Z6 C Z11 C pfet L=lg NFIN=p_fin

mn6 Z6 Z3 Z7 Z3 nfet L=lg NFIN=n_fin
mn7 Z7 A 0 A nfet L=lg NFIN=n_fin
mn8 Z7 B 0 B nfet L=lg NFIN=n_fin
mn9 Z7 C 0 C nfet L=lg NFIN=n_fin
mn10 Z6 A Z9 A nfet L=lg NFIN=n_fin
mn11 Z9 B Z10 B nfet L=lg NFIN=n_fin
mn12 Z10 C 0 C nfet L=lg NFIN=n_fin

mp13 Cout Z3 X Z3 pfet L=lg NFIN=p_fin
mn13 Cout Z3 0 Z3 nfet L=lg NFIN=n_fin

mp14 Sum Z6 X Z6 pfet L=lg NFIN=p_fin
mn14 Sum Z6 0 Z6 nfet L=lg NFIN=n_fin

*add cap
Cz Sum Gnd 'LoadCap'
Cz1 Cout Gnd 'LoadCap'

*add voltage source
VX X 0 'vdd'

VA A 0 PULSE(0 0.7 0 10p 10p 4.5u 9u)
VB B 0 PULSE(0 0.7 0 10p 10p 2.2u 4.2u)
VC C 0 PULSE(0 0.7 0 10p 10p 1u 2u)

*define the initial condition of V(Z)
.IC V(Sum)='vdd'
.IC V(Cout)='vdd'

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.1u 30u 

*print the V(Z) to waveform file *.tr0
.print V(Sum)
.print V(Cout)
.print V(X)
.print V(A)
.print V(B)
.print V(C)
.print i(Cz)
.print power(Cz)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement
.measure tran t_fall_delay_Cout TRIG V(B) VAL = 0.35 TD = 1n
+ RISE = 4 TARG V(Cout) VAL = 0.35 FALL = 7

.measure tran t_fall_delay_Sum TRIG V(C) VAL = 0.35 TD = 1n
+ RISE = 2 TARG V(Sum) VAL = 0.35 FALL = 3

.measure tran t_rise_delay_Cout TRIG V(C) VAL = 0.35 TD = 1n
+ FALL = 2 TARG V(Cout) VAL = 0.35 RISE = 1

.measure tran t_rise_delay_Sum TRIG V(C) VAL = 0.35 TD = 1n
+ FALL = 2 TARG V(Sum) VAL = 0.35 RISE = 2

.measure tran t_fall_time_Cout TRIG V(Cout) VAL = 0.56 TD = 1n
+ FALL = 2 TARG V(Cout) VAL = 0.14 FALL = 2

.measure tran t_rise_time_Cout TRIG V(Cout) VAL = 0.14 TD = 1n
+ RISE = 2 TARG V(Cout) VAL = 0.56 RISE = 2

.measure tran t_fall_time_Sum TRIG V(Sum) VAL = 0.56 TD = 1n
+ FALL = 2 TARG V(Sum) VAL = 0.14 FALL = 2

.measure tran t_rise_time_Sum TRIG V(Sum) VAL = 0.14 TD = 1n
+ RISE = 2 TARG V(Sum) VAL = 0.56 RISE = 2

.end
