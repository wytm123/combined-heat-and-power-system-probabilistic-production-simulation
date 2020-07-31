function [lpm, lpc1, lpc2] = Load2Lpc(seq1, dx1, seq2, dx2)
% Load2Lpc: form LPM (Load Probability Matrix) and LPC (Load Probility Curve) from load sequence
%   This function is aimed to form a LPM of INTEGRATED energy system,
%   as well as LPCs of each energy system.
%   However, to form a LPC of a SINGLE energy system is permitted.

%   histcounts2: Bivariate histogram bin counts


len = numel(seq1);

if nargin == 2 % only need to form one LPC
    dx2 = dx1;
    seq2 = dx1 * ones(len, 1);
end


seq1 = seq1(:);
seq2 = seq2(:);

max1 = max(seq1);
max2 = max(seq2);
ceil1 = ceil(max1 / dx1); % the upper boundary of seq1
ceil2 = ceil(max2 / dx2); % the upper boundary of seq2

% form edges
edges1 = 0:1:ceil1;
edges2 = 0:1:ceil2;
edges1 = dx1 * edges1;
edges2 = dx2 * edges2;
% edges:  0  dx  2*dx  3*dx  ...  ceil*dx

% form LPM
% -dx/100000 to let the value of right edges to be distributed into correcte bins
lpm = histcounts2(seq1-dx1/100000, seq2-dx2/100000, edges1, edges2);
lpm = lpm / numel(seq1); % each element in the LPM matrix refer to the probability
% LPM: ----->edge2
%     :
%     :
%     v
%    edge1

% form LPC
lpc1 = sum(lpm, 2); % get the sum of each row
lpc2 = sum(lpm, 1); % get the sum of each column

% change LPCs to column vectors
lpc1 = lpc1(:);
lpc2 = lpc2(:);
end