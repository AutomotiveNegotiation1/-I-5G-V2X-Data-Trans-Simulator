function CBRCDFCureveGen()
% T = load('packet_reception_ratio_3_LTE.xls');
T = load('CBRstatistic_233_5G.xls');


CDF = T(:,2);
CBR = T(:,1);

% fprintf("%i\n",CBR);'
plot(CBR,CDF,'linewidth',2.5,'displayName',"DCC OFF","color",'#4169E1')
xlabel ('Channel Busy Ratio(%)');
ylabel ('Cumulative Distribution Function'); 
legend()
grid on;
grid minor
hold on

T = load('CBRstatistic_234_5G.xls');


CDF = T(:,2);
CBR = T(:,1);

% fprintf("%i\n",CBR);
plot(CBR,CDF,'linewidth',2.5,'displayName',"proposed DCC","color",'#E3170D' )
xlabel ('Channel Busy Ratio(%)');
ylabel ('Cumulative Distribution Function'); 
grid on;

hold on
grid minor
T = load('CBRstatistic_235_5G.xls');


CDF = T(:,2);
CBR = T(:,1);

% fprintf("%i\n",CBR);
plot(CBR,CDF,'linewidth',2.5,'displayName',"original DCC","color",'#E3A869' )
xlabel ('Channel Busy Ratio(%)');
ylabel ('Cumulative Distribution Function'); 
grid on;
grid minor
end

 