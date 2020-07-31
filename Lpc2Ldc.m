function ldc = Lpc2Ldc(lpc)
% Lpc2Ldc: form LDC (Load Duration Curve) from LPC (Load Probability Curve)

%   triu: form an upper triangle matrix from the original matrix


lpc = lpc(:);
lpc = lpc';
len = numel(lpc);

lpc_matrix = ones(len,1)*lpc;

ldc_matrix = triu(lpc_matrix);
% ldc_matrix = 
% lpc(1)  lpc(2)    lpc(3)  ... lpc(n)
%   0     lpc(2)    lpc(3)  ... lpc(n)
%   0       0       lpc(3)  ... lpc(n)
%   0       0          0    ... lpc(n)
%   .       .          .    
%   .       .          .
%   .       .          .
%   0       0          0    ... lpc(n)

ldc = sum(ldc_matrix, 2); % get the sum of elements in each row

% reform LDC (Load Duration Curve) to a column vector
ldc = ldc(:); 
end