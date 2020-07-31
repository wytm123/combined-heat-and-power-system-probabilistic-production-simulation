function capa_expect_vect = GetCapaExpectVect(lpm, cost1, cost2, conv1, dx1, dx2)
% GetCapaExpectVect: get w(x) of a specific converter
%   capa_expect_vect: a vector of w(x)
%   load1: a vector of loads
%   load2: a vector of loads
%   cost: marginal cost vectors
%   conv1: a specific converter rather than a series of converters


% form load vectors (load1, load2)
[length1, ~] = size(lpm);
edges1 = 0:1:length1;
edges1 = edges1 * dx1;


load1 = 0.5 * (edges1(1:end - 1) + edges1(2:end));


capa_expect_vect = zeros(length(load1), 1);


for i = 1:length(load1)
    capa_expect = GetCapaExpect(lpm, load1(i), cost1, cost2, conv1, dx1, dx2);
    capa_expect_vect(i) = capa_expect;
end

capa_expect_vect = capa_expect_vect(:);