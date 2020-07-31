function system = CaseFile1()
% casefile1: contains the basic data of integrated energy system probabilistic production simulation
%   the load data is from a energy system of a district energy station
%% Load Profile
% Here the load profile is a time sequence of load
% seq1, seq2: refer to sub energy system 1 and sub energy system 2
system.load.dt = 1; % dt: time interval of load sequence
system.load.seq1 = [2 6 12 8 10 6];
system.load.seq2 = [4 6 6 6 10 6];


%% Generator Profile
% Here the generator profile is a combination of generators in sub system 1 and sub system 2
% State = 1: Operating; 
% No. | System | Capacity | State | Cost | FOR
system.gen = [
    1   1   2   1   1   0;
    2   1   4   1   2   0;
    3   1   2   1   2   0;
    4   1   6   1   3   0;
    5   2   2   1   1   0;
    6   2   4   1   2   0;
    7   2   4   1   3   0;
    8   2   4   1   4   0;
];

%% Energy Converter Profile
% Here the energy converter profile is a combination of two energy flow direction converters: 1-->2 and 2-->1
%   ratio: 1 FROM system's energy --> ratio TO system's energy
% No. | From | To | Capacity | State | Ratio | FOR
system.conv = [
    1   1   2   2   1   1.7     0;
    2   1   2   1   1   1.5     0;
    3   1   2   2   1   1.4     0;
    4   1   2   3   1   1.3     0;
    5   2   1   1   1   1.2     0;
    6   2   1   2   1   1.0     0;
    7   2   1   2   1   0.95    0;
    8   2   1   3   1   0.90    0;
];

end