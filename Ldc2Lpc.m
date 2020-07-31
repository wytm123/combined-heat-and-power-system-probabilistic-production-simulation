function lpc = Ldc2Lpc(ldc)
% Ldc2Lpc: form LPC (Load Probability Curve) from LDC (Load Duration Curve)

%   diff( , 1): caculate the first order difference



lpc = diff(ldc, 1);
% lpc(1) = ldc(2) - ldc(1) = -(ldc(1) - ldc(2))
% lpc(end) = ldc
lpc = -lpc;

lpc = [lpc ldc(end)];

lpc = lpc(:);
end