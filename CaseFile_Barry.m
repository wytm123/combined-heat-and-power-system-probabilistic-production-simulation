function system = CaseFile_Barry()
% This function saves the load, source and converters data of Barry Island
% Case.

%% Load Profile
system.load.dt = 1;
% electricity load sequence
system.load.seq1 = [
    742.1 705.4 668.8 668.8 687.1 778.7 916.2 998.6 1017 1017 998.6 978.6 ...
    969.5 991.1 1025.5 1081 1081 1062 1062.8 1068 1064.5 1007.8 897.8 806.3] / 1081 * 1600;
% heat load sequence
system.load.seq2 = [
    1 1 1 1 1 1 0.9 0.8 0.7 0.6 0.6 0.6 0.6 0.6 0.6 0.7 0.75 0.8 0.8 0.8 0.8 0.8 0.9 0.9] * 2921;

%% Generator Profile
% Here the generator profile is a combination of generators in sub-system 1 and sub-system 2
% State = 1: Operating
% No. | System | Capacity | State | Cost | FOR
system.gen = [
    1 1 300 1 400 0;
    2 1 350 1 450 0;
    3 1 350 1 600 0;
    4 1 400 1 500 0;
    5 1 300 1 550 0;
    6 1 400 1 510 0;
    7 2 400 1 300 0;
    8 2 400 1 350 0;
    9 2 600 1 400 0;
    10 2 500 1 450 0;
    11 2 600 1 480 0;
    12 2 500 1 500 0;
    13 2 500 1 550 0;
];


%% Energy Converter Profile
% Here the energy converter profile is a combination of 2 types of enengy converters
% Ratio: 1 FROM system's energy --> ? TO system's energy
% No. | From | To | Capacity | State | Ratio | FOR
system.conv = [
    1 1 2 200 1 1.30 0;
    2 1 2 150 1 1.35 0;
    3 1 2 200 1 1.20 0;
    4 1 2 150 1 1.15 0;
    5 1 2 150 1 1.10 0;
    6 1 2 100 1 1.05 0;
    7 2 1 200 1 1.00 0;
    8 2 1 150 1 0.95 0;
    9 2 1 150 1 0.90 0;
    10 2 1 100 1 0.85 0;
    11 2 1 150 1 0.80 0;
    12 2 1 200 1 0.75 0;
];
