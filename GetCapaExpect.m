function capa_expect = GetCapaExpect(lpm, load1, cost1, cost2, conv1, dx1, dx2)
% GetCapaExpect: get the capacity expectation of a specific load (load1) in the INTEGRATED energy system
%   capa_expect: the expectation value of capacity of conv1 at load1
%   lpm: LPM (load probability matrix)
%   load1: a specific load value
%   conv1: a specific converter, not a series of converters
%   capa_conv: a vector of the working capacity at different loads
%   capa_expect:

% get the size of load probability matrix
[~, length2] = size(lpm);

% % edges1 = 0:1:length1;
% % edges1 = edges1 * dx1;
edges2 = 0:1:length2;
edges2 = edges2 *dx2;

capa_conv = zeros(length2, 1);

% form typical load2 vector, each element is the middle of two edges
load2 = (edges2(1:end-1) + edges2(2:end)) / 2;

for i = 1:length(load2)
    capa_conv(i) = GetCapaConv(load1, load2(i), cost1, cost2, conv1, dx1, dx2);
end

index1 = load1 / dx1;
index1 = ceil(index1);

% LPV (Load Probability Vector), is a row / column vector of LPM
lpv = lpm(index1, :);


capa_conv = capa_conv(:);
lpv = lpv(:);

capa_expect = sum(lpv .* capa_conv);
