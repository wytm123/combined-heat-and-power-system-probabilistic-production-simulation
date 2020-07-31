function conv_select = GetConv(conv, f_flag, t_flag, mode)
% GetConv: get the selected and sorted converter data (selected by FROM flag and TO flag and then sorted by mode)
%   f_flag: a flag of the FROM energy system of the converters to be selected
%   t_flag: a flag of the TO energy system of the converters to be selected
%   mode: mode of sorting the selected converters
%   the modes include: AUTO and FOR



if nargin < 4
    mode = 'auto';
end

% select converters by FROM energy system and TO energy system
index = conv(:,2)==f_flag; % select by FROM energy system
conv_select = conv(index,:);
index = conv_select(:,3)==t_flag; % select by TO energy system
conv_select = conv_select(index,:);

% sort selected converters by mode
switch lower(mode)
    case 'auto' % sort by Ratio and Capacity, Ratio is more important
        conv_select = sortrows(conv_select, 4); % arrange small converters first
        conv_select = sortrows(conv_select, 6, 'descend'); % Ratio higher = better
    case 'for' % sort by Ratio and FOR, Ratio is more important
        conv_select = sortrows(conv_select, 7); % FOR lower = better
        conv_select = sortrows(conv_select, 6);
end
end
        
        