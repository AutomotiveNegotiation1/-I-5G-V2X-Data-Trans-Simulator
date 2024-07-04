function [appParams,phyParams] = calculateNB_5G(appParams,phyParams)
% compute NbeaconsF and NbeaconsT

% 5G doesn't have adjacent and non adjacent mode, since the SCI is carried along the transport block


% Vector of supported subchannel sizes for NR (3GPP TR 38.886 V16.0.0 (2020-06))
% the admitted sizes are all valid for FFT
phyParams.supportedSizeSubchannel_5G = [10,15,20,25,50,75,100];

% Check whether the input sizeSubchannel is supported
if isempty(find(phyParams.supportedSizeSubchannel_5G==phyParams.sizeSubchannel, 1))
        error('Error the selected subchannel size is not supported');
end

% Find number of RBs per subchannel (or multiple)
phyParams.RBsBeaconSubchannel = phyParams.NsubchannelsBeacon*phyParams.sizeSubchannel;

        
% Find number of beacons in the frequency domain (if subchannels can or cannot overlap)
    if phyParams.BRoverlapAllowed
        appParams.NbeaconsF = phyParams.NsubchannelsFrequency - phyParams.NsubchannelsBeacon + 1;
    else
        appParams.NbeaconsF = floor(appParams.RBsFrequencyV2V/(phyParams.RBsBeaconSubchannel));
    end

% Find number of beacons in the time domain
appParams.NbeaconsT = floor(appParams.allocationPeriod/phyParams.Tslot_NR);

end    
    