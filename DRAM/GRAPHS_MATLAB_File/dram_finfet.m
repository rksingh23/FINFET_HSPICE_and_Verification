input_data = importdata(strcat(pwd,"./dram_finfet.txt"));
Fin = input_data.data(:,1);
Capacitance_FINFET = input_data.data(:,3);
RTL_FINFET=input_data.data(:,5);
avgcurrent_FINFET=input_data.data(:,2);
avgPower_FINFET=input_data.data(:,4);

AverageCurrent_FINFET=[];
AveragePower_FINFET=[];
RtlPlotFinfet=[];

for i=1:11
    RtlPlotFinfet=horzcat(RtlPlotFinfet,RTL_FINFET(1+5*(i-1):5*i));
    AverageCurrent_FINFET=horzcat(AverageCurrent_FINFET,avgcurrent_FINFET(1+5*(i-1):5*i));
    AveragePower_FINFET=horzcat(AveragePower_FINFET,avgPower_FINFET(1+5*(i-1):5*i));
end

figure
surf(unique(Capacitance_FINFET),unique(Fin),RtlPlotFinfet)
title('DRAM FINFET Refresh Time Limit Plot')
xlabel('Capacitance_Load (fF)')
ylabel('PFins')
zlabel('RTL(sec)')

figure
surf(unique(Capacitance_FINFET),unique(Fin),AverageCurrent_FINFET)
title('DRAM FINFET Average Current Plot')
xlabel('Capacitance_Load (fF)')
ylabel('Fins')
zlabel('Average_Current (Amp)')

figure
surf(unique(Capacitance_FINFET),unique(Fin),AveragePower_FINFET)
title('DRAM FINFET Average Power Plot')
xlabel('Capacitance_Load (fF)')
ylabel('Fins')
zlabel('Average_Power (Watt)')