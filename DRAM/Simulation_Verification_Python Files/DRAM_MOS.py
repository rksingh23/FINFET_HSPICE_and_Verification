f = open("./DRAM_MOSFET_Sweep.mt0", "r")
a = f.read()
b=a.split('\n')
#print(len(b))
multiplier=[]
loadcap_mos=[]
rtl_mos=[]
avg_current_mos=[]
avg_power_mos=[]

for i in range(0,len(b)-1,3):
    if(i>4):
        #print(i,b[i-1])
        list=[]
        t=b[i-1].split(" ")
        for i1 in t:
            if(i1):
                list.append(i1)
        multiplier.append(list[1])
        loadcap_mos.append(list[2])
        rtl_mos.append(list[3])
        
        list1=[]
        #print(b[i])
        t1=b[i].split(" ")
        for j in t1:
            if (j):
                list1.append(j)
        avg_current_mos.append(list1[0])
        avg_power_mos.append(list1[1]) 
#print ("avg_current_Mosfet array", avg_current_mos)
#print('\n')
#print ("Multiplier array " , multiplier)
#print('\n')
#print ("loadcap_Mosfet array", loadcap_mos)
#print('\n')
#print ("avg_power_Mosfet array", avg_power_mos)
#print('\n')
#print ("rtl_Mosfet array", rtl_mos)

f=open("mosfet_finfet.txt","w")
f1=open("mosfet_finfet.csv","w")
f.write("multiplier,avg_current,loadcap,avg_power,rtl\n")
f1.write("multiplier,avg_current,loadcap,avg_power,rtl\n")
#print(len(multiplier))
for i in range(len(multiplier)):
    f.write(str(multiplier[i])+","+str(avg_current_mos[i])+','+str(loadcap_mos[i])+","+str(avg_power_mos[i])+','+str(rtl_mos[i])+'\n')
    f1.write(str(multiplier[i])+","+str(avg_current_mos[i])+','+str(loadcap_mos[i])+","+str(avg_power_mos[i])+','+str(rtl_mos[i])+'\n')
f.close()
f1.close()