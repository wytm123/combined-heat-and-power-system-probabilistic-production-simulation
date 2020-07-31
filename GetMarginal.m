function [mc, capa] = GetMarginal(load, dx, cost)
% GetMarginal: caculate the UP/DOWN marginal cost and the UP/DOWN capacity of load
% in the same marginal cost according to mode
%   mc: marginal cost of load
%   capa: UP/DOWN capacity of load in the same marginal cost
%   load: the specific POSITIVE load VALUE rather than a vector
%   cost: the cost VECTOR


index_end = numel(cost);
capa_max = index_end * dx; % the capacity of energy system


% divide into 5 circumstances according to load
if abs(load) < dx / 10000
    mc.up = inf; % if set mc.up to 0, it will stuck at an extremly small value like - 1e-15
    mc.down = inf;
    capa.up = 0 - load;
    capa.down = 0;
    % warning('Should be aware that load is NEGATIVE.');
    
elseif (load - capa_max) > abs(dx / 10000)
    mc.up = inf;
    mc.down = 0;
    capa.up = 0;
    capa.down = load - capa_max;
    % warning('Should be aware that the load is ABOVE the system capacity.')
    
elseif load == 0
    mc.up = cost(1);
    mc.down = inf;
    capa.down = 0;
    index_upedge = find(cost == mc.up, 1, 'last');
    capa.up = index_upedge*dx - load;
    
elseif load == capa_max
    mc.up = inf;
    mc.down = cost(end);
    capa.up = 0;
    index_downedge = find(cost < mc.down, 1, 'last');
    capa.down = load - index_downedge*dx;
    
else % 0 < load < capa_max
    index = ceil(load / dx);
    cost_load = cost(index); % the cost of the load level
    mc.up = cost_load;
    mc.down = cost_load;
    index_upedge = find(cost == cost_load, 1, 'last');
    
    if index_upedge == load / dx % the load is on the upedge
        mc.up = cost(index + 1);
        index_upedge = find(cost == mc.up, 1, 'last');
    end
    
    if cost_load == cost(1) % load is already on the first cost level
        index_downedge = 0;
    else
        index_downedge = find(cost < cost_load, 1, 'last');
    end
    
% % % %     index_downedge = find(cost < cost_load, 1, 'last');
% % % %     if isempty(index_downedge) % load is already on the first cost level
% % % %         index_downedge = 0;
% % % %     end
    
    capa.up = index_upedge*dx - load;
    capa.down = load - index_downedge*dx;
end
end
    

