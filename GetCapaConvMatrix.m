function capa_conv_matrix = GetCapaConvMatrix(lpm, cost1, cost2, conv1, dx1, dx2)
% GetCapaConvMatrix: form a matrix as the size of LPM, each element is the converted capacity of this typical scene
%   conv1: a specific converter, not a series of converters


% form load1, load2 vector
[length1, length2] = size(lpm);

ratio = conv1(6);
capa1 = conv1(4);
capa2 = capa1 * ratio;

add1 = ceil(capa1 / dx1);
add2 = ceil(capa2 / dx2);

edges1 = 0:1:(length1 + add1);
edges2 = 0:1:(length2 + add2);
edges1 = edges1 * dx1;
edges2 = edges2 * dx2;

load1 = 0.5 * (edges1(1:end - 1) + edges1(2:end));
load2 = 0.5 * (edges2(1:end - 1) + edges2(2:end));


% form CCM (Converted Capacity Matrix)
capa_conv_matrix = zeros(length(load1), length(load2));

for i = 1 : length(load1)
    for j = 1 : length(load2)
        capa_conv = GetCapaConv(load1(i), load2(j), cost1, cost2, conv1, dx1, dx2);
        capa_conv_matrix(i, j) = capa_conv;
    end
end

        