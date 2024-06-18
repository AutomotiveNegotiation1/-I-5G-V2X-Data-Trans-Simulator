function PRRDistanceCurveGen()
% T = load('packet_reception_ratio_3_LTE.xls');
T = load('packet_reception_ratio_233_5G.xls');

% PRR = zeros(52);
PRR = T(:,6);
Distance = T(:,1);
% fprintf("%i\n",PRR);
plot(Distance,PRR,'linewidth',2.5,'displayName',"DCC OFF");
xlabel ('Distance(m)');
ylabel ('Packet Reception Ratio(%)'); 
legend()
grid on;
grid minor
hold on;


T = load('packet_reception_ratio_234_5G.xls');
PRR = T(:,6);
Distance = T(:,1);
plot(Distance,PRR,'linewidth',2.5,'displayName',"proposed DCC" );
xlabel ('Distance(m)');
ylabel ('Packet Reception Ratio(%)'); 
grid on;
grid minor
hold on;

T = load('packet_reception_ratio_235_5G.xls');
PRR = T(:,6);
Distance = T(:,1);
plot(Distance,PRR,'linewidth',2.5,'displayName',"original DCC");

xlabel ('Distance(m)');
ylabel ('Packet Reception Ratio(%)'); 
grid on;
grid minor
end

