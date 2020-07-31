function [loadnew1, loadnew2, capa_left1, flag1] = GetCapa(load1, load2, cost1, cost2, conv1, dx1, dx2)
% GetCapa: get the operation capacity of the specific energy converter
%   load: load1, load2 refer to a specific VALUE rather than a vector
%   cost: cost1, cost2 refer to marginal cost VECTORs of each energy system
%   conv: conv refer to a specific energy converter rather than a series of converters
%   flag: flag = 0 --> the converter can convert more
%         flag = 1 --> the converter cannot convert more (reason: (1)economy(2)capacity)


flag1 = 0;


ratio1 = conv1(6);


capa_left1 = conv1(4);



% GetMarginal: get UP/DOWN marginal cost and capacity of energy system
[mc1, capa1] = GetMarginal(load1, dx1, cost1);
[mc2, capa2] = GetMarginal(load2, dx2, cost2);


% GetDirection: get the direction of energy flow in the INTEGRATED energy system
[direc1, direc2] = GetDirection(mc1, mc2, conv1);



% divide into 2 circumstances
if strcmp(direc1, 'none') && strcmp(direc2, 'none') % converter 1 & 2 not working
    loadnew1 = load1;
    loadnew2 = load2;
    % capa_left1, capa_left2 remain unchanged.
    flag1 = 1; % economy reason
    
elseif strcmp(direc1, 'up') && strcmp(direc2, 'down') % converter 1 working, 1st energy --> 2nd energy
    capa_using = min([capa1.up, capa2.down / ratio1, capa_left1]);
    loadnew1 = load1 + capa_using;
    loadnew2 = load2 - capa_using * ratio1;
    
    % due to numerical caculation, sometimes loadnew2 will be a small value around 0,
    % when it happens, set loadnew2 to 0
    if abs(loadnew2) < dx2 / 1000
        loadnew2 = 0;
    end
    
    if capa_using == capa_left1
        flag1 = 1; % capacity reason of converter
    end
    
    if loadnew2 == 0
        flag1 = 1; % capacity reason of energy system 2
    end
    
    
    
    
    capa_left1 = capa_left1 - capa_using;
    % capa_left2 remain unchanged
    
    
end
end


