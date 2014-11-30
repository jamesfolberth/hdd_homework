function [overlap, omega_til] = overlap(omega, C)

omega_til = ones(size(omega));
omega_til(C(:,2) == 1) = -1;

overlap = max(sum(omega == omega_til), sum(-omega == omega_til)); % raw
overlap = 2/numel(omega)*overlap - 1; 

end
