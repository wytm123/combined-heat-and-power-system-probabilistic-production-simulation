function capa_conv = GetCapaConv(load1, load2, cost1, cost2, conv1, dx1, dx2)
% GetCapaConv: Get the Capacity of a specific type 1 converter(1st energy-->2nd energy) at a specific load
%   capa_conv: the capacity of a specific type 1 converter being using


capa_max = conv1(4);

while 1
    [loadnew1, loadnew2, capa_left1, flag1] = GetCapa(load1, load2, cost1, cost2, conv1, dx1, dx2);
    
    if flag1 == 1 % conv1 cannot convert more
        break
    else % conv1 can convert more
        load1 = loadnew1;
        load2 = loadnew2;
        conv1(4) = capa_left1;
    end
end

capa_conv = capa_max - capa_left1;
    