*************************
*  lab3 sample hspice
*************************

.include './hp7nfet.pm'
.include './hp7pfet.pm'

*define parameters 
.param vdd=0.7 
.param vss=0 
.param fin_height=18n 
.param fin_width=7n 
.param lg=11n 
.param p_fin = 1

VSS Gnd 0 'vss'

.param LoadCap = 1f

*name drain frontgate source backgate 
*add transistors  
mp1 Z vdd X vdd pfet L=lg NFIN=p_fin

*add cap
Cz Z Gnd 'LoadCap'

*add voltage source
VX X 0 'vdd/2'
VY Y 0 'vdd'

*define the initial condition of V(Z)
.IC V(Z)='vdd'

*do transient analysis
	*syntax: .TRAN tiner tstop START=stval 
	*tiner - time step
	*tstop - final time
	*stval - initial time (default 0)
.tran 0.5m 2050m SWEEP data=table

.data table
p_fin LoadCap
1		1f
2		1f
3		1f
4		1f
5		1f
*50000^0.1 = 2.9505
1		2.9505f
2		2.9505f
3		2.9505f
4		2.9505f
5		2.9505f
*50000^0.2 = 8.70551
1		8.70551f
2		8.70551f
3		8.70551f
4		8.70551f
5		8.70551f
*50000^0.3 = 25.6857
1		25.6857f
2		25.6857f
3		25.6857f
4		25.6857f
5		25.6857f
*50000^0.4 = 75.7858
1		75.7858f
2		75.7858f
3		75.7858f
4		75.7858f
5		75.7858f
*50000^0.5 = 223.607
1		223.607f
2		223.607f
3		223.607f
4		223.607f
5		223.607f
*50000^0.6 = 659.754
1		659.754f
2		659.754f
3		659.754f
4		659.754f
5		659.754f
*50000^0.7 = 1946.61
1		1946.61f
2		1946.61f
3		1946.61f
4		1946.61f
5		1946.61f
*50000^0.8 = 5743.49
1		5743.49f
2		5743.49f
3		5743.49f
4		5743.49f
5		5743.49f
*50000^0.9 = 16946.2
1		16946.2f
2		16946.2f
3		16946.2f
4		16946.2f
5		16946.2f
*50000^1.0 = 50000
1		50000f
2		50000f
3		50000f
4		50000f
5		50000f


*print the V(Z) to waveform file *.tr0
*.print V(X)
*.print V(Y)
.print V(Z)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement --> These are samples of measurements. Modify as per your requirement.
.measure tran RTL TRIG AT=0 TARG v(Z) VAL=0.355 FALL=1
.measure tran avg_current AVG I(Cz) from 0 to 'RTL'
.measure tran avg_power AVG p(Cz) 



.end
