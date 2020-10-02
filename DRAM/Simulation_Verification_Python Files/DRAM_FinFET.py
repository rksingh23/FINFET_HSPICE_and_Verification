f = open("./DRAM_Sweep.mt0", "r")
a = f.read()
b=a.split('\n')
#print(len(b))
pfin=[]
loadcap=[]
rtl=[]
avg_current=[]
avg_power=[]

for i in range(0,len(b)-1,3):
    if(i>4):
        #print(i,b[i-1])
        list=[]
        t=b[i-1].split(" ")
        for i1 in t:
            if(i1):
                list.append(float(i1))
        pfin.append(list[1])
        loadcap.append(list[2])
        rtl.append(list[3])
        
        list1=[]
        #print(b[i])
        t1=b[i].split(" ")
        for j in t1:
            if (j):
                list1.append(j)
        avg_current.append(list1[0])
        avg_power.append(list1[1]) 
#print ("avg_current array", avg_current)
#print('\n')
#print ("Pfin array " , pfin)
#print('\n')
#print ("loadcap array", loadcap)
#print('\n')
#print ("avg_power array", avg_power)
#print('\n')
#print ("rtl array", rtl)

f=open("dram_finfet.txt","w")
f1=open("dram_finfet.csv","w")
f.write("pfin,avg_current,loadcap,avg_power,rtl\n")
f1.write("pfin,avg_current,loadcap,avg_power,rtl\n")
for i in range(len(pfin)):
    f.write(str(pfin[i])+","+str(avg_current[i])+','+str(loadcap[i])+","+str(avg_power[i])+','+str(rtl[i])+'\n')
    f1.write(str(pfin[i])+","+str(avg_current[i])+','+str(loadcap[i])+","+str(avg_power[i])+','+str(rtl[i])+'\n')
f.close()
f1.close()
