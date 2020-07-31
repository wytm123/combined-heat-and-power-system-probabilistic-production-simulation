function margcost = GetCost(gen, dx)
% GetCost: form cost vector of an energy system
%   The aim of this function is to form a marginal cost vector of a single
%   energy system.

%   repelem: repeat the elements in the matrix
%   repelem(a, b): repeat each element in vector a for corresponding number
%   of times in vector b

%   matgcost: marginal cost vector



capa = gen(:,3);
cost = gen(:,5);
capa = round(capa / dx);

margcost = repelem(cost, capa);
% repreat each element in cost for capa times.
% repeat cost(1) for capa(1) / dx times
% repeat cost(2) for capa(2) / dx times
% repeat cost(i) for capa(i) / dx times

margcost = margcost(:);

end