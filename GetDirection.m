function [direc1, direc2] = GetDirection(mc1, mc2, conv1)
% GetDirection: to get the direction of energy flow in the INTEGRATED energy system
%   mc1.up: UP marginal cost of energy system 1
%   mc1.down: DOWN marginal cost of energy system 1
%   mc2.up: UP marginal cost of energy system 2
%   mc2.down: DOWN marginal cost of energy system 2
%   conv1: energy converter that can convert 1st energy to 2nd energy
%   conv2: energy converter that can convert 2nd energy to 1st energy
%   direc: direction of energy flow
%   direc1: 'UP' refers to energy flow from 1st energy system to 2nd energy system
%           'DOWN' refers to energy flow from 2nd energy system to 1st energy system
%           'NONE' refers to converter 1 & 2 not working
%   direc2: 'UP' refers to energy flow from 2nd energy system to 1st energy system
%           'DOWN' refers to energy flow from 1st energy system to 1st energy system
%           'NONE' refers to converter1 and 2 not working
% NOTICE: the order of mc1 and mc2 matters a lot.


ratio1 = conv1(6);




% get import cost of each system
% import cost of 2nd energy system (1st energy --> 2nd energy)
mc1_expt = mc1.up / ratio1;
mc2_impt = mc1_expt;



% compare economy of import and self supply
% energy flow from 1st energy system --> 2nd energy system
if mc2_impt < mc2.down
    direc1 = 'up';
    direc2 = 'down';
    
% INTEGRATED energy system working separately    
elseif mc2_impt >= mc2.down
    direc1 = 'none';
    direc2 = 'none';

end
end

