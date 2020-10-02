*************************
*  lab3 sample hspice
*************************

.include './lp32nm.pm'

*define parameters 
.param vdd=1.0 
.param vss=0 
.param multiplier = 1
.param wd=120n*multiplier
.param lg=32n 

VSS Gnd 0 'vss'

.param LoadCap = 1f

*name drain frontgate source backgate 
*add transistors  
mp1 Z vdd X vdd pmos L=lg W=wd

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
.tran 0.5m 7550m SWEEP data=table

.data table
multiplier LoadCap
1		1f
2		1f
3		1f
4		1f
5		1f
6		1f
7		1f
8		1f
9		1f
10		1f
11		1f
12		1f
13		1f
14		1f
15		1f
16		1f
*50000^0.1 = 2.9505
1		2.9505f
2		2.9505f
3		2.9505f
4		2.9505f
5		2.9505f
6		2.9505f
7		2.9505f
8		2.9505f
9		2.9505f
10		2.9505f
11		2.9505f
12		2.9505f
13		2.9505f
14		2.9505f
15		2.9505f
16		2.9505f
*50000^0.2 = 8.70551
1		8.70551f
2		8.70551f
3		8.70551f
4		8.70551f
5		8.70551f
6		8.70551f
7		8.70551f
8		8.70551f
9		8.70551f
10		8.70551f
11		8.70551f
12		8.70551f
13		8.70551f
14		8.70551f
15		8.70551f
16		8.70551f
*50000^0.3 = 25.6857
1		25.6857f
2		25.6857f
3		25.6857f
4		25.6857f
5		25.6857f
6		25.6857f
7		25.6857f
8		25.6857f
9		25.6857f
10		25.6857f
11		25.6857f
12		25.6857f
13		25.6857f
14		25.6857f
15		25.6857f
16		25.6857f
*50000^0.4 = 75.7858
1		75.7858f
2		75.7858f
3		75.7858f
4		75.7858f
5		75.7858f
6		75.7858f
7		75.7858f
8		75.7858f
9		75.7858f
10		75.7858f
11		75.7858f
12		75.7858f
13		75.7858f
14		75.7858f
15		75.7858f
16		75.7858f
*50000^0.5 = 223.607
1		223.607f
2		223.607f
3		223.607f
4		223.607f
5		223.607f
6		223.607f
7		223.607f
8		223.607f
9		223.607f
10		223.607f
11		223.607f
12		223.607f
13		223.607f
14		223.607f
15		223.607f
16		223.607f
*50000^0.6 = 659.754
1		659.754f
2		659.754f
3		659.754f
4		659.754f
5		659.754f
6		659.754f
7		659.754f
8		659.754f
9		659.754f
10		659.754f
11		659.754f
12		659.754f
13		659.754f
14		659.754f
15		659.754f
16		659.754f
*50000^0.7 = 1946.61
1		1946.61f
2		1946.61f
3		1946.61f
4		1946.61f
5		1946.61f
6		1946.61f
7		1946.61f
8		1946.61f
9		1946.61f
10		1946.61f
11		1946.61f
12		1946.61f
13		1946.61f
14		1946.61f
15		1946.61f
16		1946.61f
*50000^0.8 = 5743.49
1		5743.49f
2		5743.49f
3		5743.49f
4		5743.49f
5		5743.49f
6		5743.49f
7		5743.49f
8		5743.49f
9		5743.49f
10		5743.49f
11		5743.49f
12		5743.49f
13		5743.49f
14		5743.49f
15		5743.49f
16		5743.49f
*50000^0.9 = 16946.2
1		16946.2f
2		16946.2f
3		16946.2f
4		16946.2f
5		16946.2f
6		16946.2f
7		16946.2f
8		16946.2f
9		16946.2f
10		16946.2f
11		16946.2f
12		16946.2f
13		16946.2f
14		16946.2f
15		16946.2f
16		16946.2f
*50000^1.0 = 50000
1		50000f
2		50000f
3		50000f
4		50000f
5		50000f
6		50000f
7		50000f
8		50000f
9		50000f
10		50000f
11		50000f
12		50000f
13		50000f
14		50000f
15		50000f
16		50000f

*print the V(Z) to waveform file *.tr0
*.print V(X)
*.print V(Y)
.print V(Z)

*simulation options (you can modify this. Post is needed for .tran analysis)
.OPTION Post Brief NoMod probe measout

*measurement --> These are samples of measurements. Modify as per your requirement.
.measure tran RTL TRIG AT=0 TARG v(Z) VAL=0.55 FALL=1
.measure tran avg_current AVG I(Cz) from 0 to 'RTL'
.measure tran avg_power AVG p(Cz) 

.end
