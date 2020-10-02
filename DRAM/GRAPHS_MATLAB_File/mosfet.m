MOS_data = importdata(strcat(pwd,"./mosfet_finfet.txt"));
Multiplier = MOS_data.data(:,1);
Cap_MOS = MOS_data.data(:,3);
RTL_MOS=MOS_data.data(:,5);
avg_I_MOS=MOS_data.data(:,2);
avg_P_MOS=MOS_data.data(:,4);

RTL_plot_MOS=[];
I_avg_MOS=[];
P_avg_MOS=[];

for i=1:11
    RTL_plot_MOS=horzcat(RTL_plot_MOS,RTL_MOS(1+16*(i-1):16*i));
    I_avg_MOS=horzcat(I_avg_MOS,avg_I_MOS(1+16*(i-1):16*i));
    P_avg_MOS=horzcat(P_avg_MOS,avg_P_MOS(1+16*(i-1):16*i));
end

figure
surf(unique(Cap_MOS),unique(Multiplier),RTL_plot_MOS)
title('DRAM MOS RTL Plot')
xlabel('Capacitance Load (fF)')
ylabel('Multiplier')
zlabel('Refresh Time Limit (sec)')

figure
surf(unique(Cap_MOS),unique(Multiplier),I_avg_MOS)
title('DRAM MOS Average Current Plot')
xlabel('Capacitance Load (fF)')
ylabel('Multiplier')
zlabel('Average Current (Amp)')

figure
surf(unique(Cap_MOS),unique(Multiplier),P_avg_MOS)
title('DRAM MOS Average Power Plot')
xlabel('Capacitance Load (fF)')
ylabel('Multiplier')
zlabel('Average Power (Watt)')