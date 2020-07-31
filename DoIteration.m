function [lpm, capa_conv_matrix1, capa_conv_matrix2] = DoIteration(lpm0, cost1, cost2, conv1, dx1 ,dx2)
% DoIteration: do iterations about a series of converters
%   lpm0: original lpm
%   conv1: a series of converters in the same type, not a specific converter


[nconv, ~] = size(conv1);
lpm = lpm0;





for i = 1:nconv
    conv_specific = conv1(i,:);
    ratio = conv_specific(6);
    capa1 = conv_specific(4);
    capa2 = capa1 * ratio;
    
    
    % 1st energy capa_conv_matrix
    capa_conv_matrix1 = GetCapaConvMatrix(lpm, cost1, cost2, conv_specific, dx1, dx2);
    % 2nd energy capa_conv_matrix
    capa_conv_matrix2 = capa_conv_matrix1 / ratio;
    
    add1 = ceil(capa1 / dx1);
    add2 = ceil(capa2 / dx2);
    
    [length1_old, length2_old] = size(lpm);
    length1 = length1_old + add1;
    length2 = length2_old + add2;
    
    lpm_new = zeros(length1, length2);
    lpm = blkdiag(lpm, zeros(add1, add2));
%     shift1_matrix = zeros(length1, length2);
%     shift2_matrix = zeros(length1, length2);
    
    % form new lpm
    for p1 = 1:length1_old % the iteration is about the old lpm
        for p2 = 1:length2_old % the iteration is about the old lpm
            shift1 = capa_conv_matrix1(p1, p2) / dx1;
            shift2 = capa_conv_matrix2(p1, p2) / dx2;
            shift1 = round(shift1);
            shift2 = round(shift2);
            lpm_new(p1 + shift1, p2 - shift2) = lpm_new(p1 + shift1, p2 - shift2) + lpm(p1, p2);
            
        end
    end
    
    lpm = lpm_new;
end
            