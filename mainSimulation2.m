% Simplified scenario to use WilabV2Xsim
% Packet size and MCS are set accordingly to utilize the whole channel
% Each transmission uses all the subchannels available.
% NR-V2X is considered for these simulations

close all    % Close all open figures
clear        % Reset variables
clc          % Clear the command window

packetSize=350;        % 1000B packet size
nTransm=1;              % Number of transmission for each packet
sizeSubchannel=10;      % Number of Resource Blocks for each subchannel
Raw = [200];   % Range of Awarness for evaluation of metrics
speed=120;               % Average speed
speedStDev=7;           % Standard deviation speed
SCS=15;                 % Subcarrier spacing [kHz]
pKeep=0.8;              % keep probability
periodicity=0.1;        % periodic generation every 100ms
sensingThreshold=-126;  % threshold to detect resources as busy

% Configuraion file
configFile = 'Highway3GPP.cfg';


%% NR-V2X PERIODIC GENERATION
for BandMHz=[10]

if BandMHz==10
    MCS=4;
elseif BandMHz==20
    MCS=5;
end    

for rho=[ 100 300 ] % number of vehicles/km

        % Just for visualization purposes the simulations time now are really short,
        % when performing actual simulation, each run should take at least
        % 30mins or one hour of computation time.

 if rho==50
        simTime=50;     % simTime=300
    elseif rho==100
        simTime=300;      % simTime=150;
    elseif rho==300
        simTime=300; % simTime=100;

 end
    
% HD periodic
outputFolder = sprintf('Output/NRV2X_%dMHz_periodic',BandMHz);

% Launches simulation
WiLabV2Xsim(configFile,'outputFolder',outputFolder,'Technology','5G-V2X','MCS_NR',MCS,'SCS_NR',SCS,'beaconSizeBytes',packetSize,...
    'simulationTime',simTime,'rho',rho,'probResKeep',pKeep,'BwMHz',BandMHz,'vMean',speed,'vStDev',speedStDev,...
    'cv2xNumberOfReplicasMax',nTransm,'allocationPeriod',periodicity,'sizeSubchannel',sizeSubchannel,...
    'powerThresholdAutonomous',sensingThreshold,'FixedPdensity',true,'dcc_active',true,'cbrActive',true)
end
end
