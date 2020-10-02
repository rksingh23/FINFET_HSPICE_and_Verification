from statistics import stdev
from statistics import mean

file = open("./DRAM_Sweep.mt0", "r")
file1= open("./DRAM_MOSFET_Sweep.mt0", "r")
data = file.read()
data1 = file1.read()
b=data.split('\n')
b1=data.split('\n')
p_fin = []
mul = []
avg_current = []
avg_current_mos = []
loadcap = []
loadcap_mos = []
avg_power = []
avg_power_mos = []
rtl = []
rtl_mos = []


for i in range(0, len(b)-1, 3):
    if(i > 4):
        #print (b[i-1])
        list = []
        temp1 = b[i-1].split(" ")
        for var in temp1:
            if(var):
                list.append(float(var))
        p_fin.append(list[1])
        loadcap.append(list[2])
        rtl.append(list[3])       

        #i
        list1 = []
        temp1 = b[i].split(" ")
        for var in temp1:
            if(var):
                list1.append(float(var))
        #print (list)
        avg_current.append(list1[0])
        avg_power.append(list1[1])

print("Maximum value of RTL "+str(max(rtl)))
print("Minimum value of RTL "+str(min(rtl)))  
print("Standard Deviation of RTL "+str(stdev(rtl)))
print("Average value of RTL "+str(mean(rtl)))
print("Average value of Average Current "+str(mean(avg_current)))
print("Maximum value of Average Current "+str(max(avg_current)))
print("Minimum value of Average Current "+str(min(avg_current)))  
print("Standard Deviation of Average Current "+str(stdev(avg_current)))
print("Maximum value of average power "+str(max(avg_power)))
print("Minimum value of average power "+str(min(avg_power)))  
print("Standard Deviation of average power "+str(stdev(avg_power)))
print("Average value of average power "+str(mean(avg_power)))


for i in range(0, len(b1)-1, 3):
    if(i > 4):
        #print (b[i-1])
        list2 = []
        temp2 = b1[i-1].split(" ")
        for var1 in temp2:
            if(var1):
                list2.append(float(var1))
        mul.append(list2[1])
        loadcap_mos.append(list2[2])
        rtl_mos.append(list2[3])       

        #i
        list3 = []
        temp3 = b[i].split(" ")
        for var2 in temp3:
            if(var2):
                list3.append(float(var2))
        #print (list)
        avg_current_mos.append(list3[0])
        avg_power_mos.append(list3[1])

print("Maximum value of RTL MOS "+str(max(rtl_mos)))
print("Minimum value of RTL MOS"+str(min(rtl_mos)))  
print("Standard Deviation of RTL MOS "+str(stdev(rtl_mos)))
print("Average value of RTL MOS"+str(mean(rtl_mos)))
print("Average value of Average Current MOS"+str(mean(avg_current_mos)))
print("Maximum value of Average Current MOS"+str(max(avg_current_mos)))
print("Minimum value of Average Current MOS"+str(min(avg_current_mos)))  
print("Standard Deviation of Average Current MOS"+str(stdev(avg_current_mos)))
print("Maximum value of average power MOS"+str(max(avg_power_mos)))
print("Minimum value of average power MOS"+str(min(avg_power_mos)))  
print("Standard Deviation of average power MOS"+str(stdev(avg_power_mos)))
print("Average value of average power MOS"+str(mean(avg_power_mos)))

