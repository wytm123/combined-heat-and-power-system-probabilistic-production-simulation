% load system data
system = CaseFile_Barry();
dx1 = 50;
dx2 = 50;

% select and sort generators
gen1 = GetGen(system.gen, 1, 'auto');
gen2 = GetGen(system.gen, 2, 'auto');

% select and sort converters
conv1 = GetConv(system.conv, 1, 2, 'auto');
conv2 = GetConv(system.conv, 2, 1, 'auto');

% get original LPM and LPCs
[lpm, lpc1, lpc2] = Load2Lpc(system.load.seq1, dx1, system.load.seq2, dx2);

% get cost
cost1 = GetCost(gen1, dx1);
cost2 = GetCost(gen2, dx2);



% do iteration
[lpm, capa_conv_matrix1, capa_conv_matrix2] = DoIteration(lpm, cost1, cost2, conv1, dx1, dx2);




