function gen_select = GetGen(gen, flag, mode)
% GetGen: get the selected and sorted generator data (selected by flag and then sorted by mode)
%   flag: flag of energy system of generator, including 1 & 2, respectively to generators in 1st energy system and generators in 2nd energy system
%   mode: mode of sorting the generators in the specific type which is specified by flag
%   mode including AUTO and FOR



if nargin < 3
    mode = 'auto';
end

% select gen by flag of energy system
index = gen(:,2)==flag;
gen_select = gen(index,:);

% select gen in selected energy system by State
%   State = 1: Operating
index = gen_select(:,4)==1;
gen_select = gen_select(index,:);

% sort gen by mode
mode = lower(mode);

switch mode
    case 'auto' % sort by Cost and Capacity, Cost is more important
        gen_select = sortrows(gen_select, 3); % arrange small generators first
        gen_select = sortrows(gen_select, 5);
    
    case 'for' % sort by Cost and FOR, Cost is more important
        gen_select = sortrows(gen_select, 6);
        gen_select = sortrows(gen_select, 5);
end
        
end
