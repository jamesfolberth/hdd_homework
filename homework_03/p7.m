% GNU Octave
function [] = p7(savefile='rankings.mat')
load(savefile)

i = 5; % choose one of the alphas
rank = rankings(:,i);

r = [linspace(0,.1,50) .2:.1:1];
[nr] = hist(rank,r);
nr = nr / sum(nr);
loglog(r, nr, 'o');

% fit line on loglog plot
hold on
nfit = nr(2:30);
nfit = nfit(nfit>0); % only use non-empty bins
xfit = r(2:30);
xfit = xfit(nfit>0);

xfit = log10(xfit);
nfit = log10(nfit);
A = [ones([numel(xfit) 1]) reshape(xfit, [numel(xfit) 1])];
p = A\reshape(nfit, [numel(nfit) 1])

f = p(1)*A(:,1) + p(2)*A(:,2);
loglog(10.^xfit, 10.^reshape(f,size(nfit)), 'r');
hold off

xlabel('rank $r$');
ylabel('Frequency of ranking $g(r)$');
title('Distribution of rankings - \alpha = 0.99');
print('figures/p7.tikz','-dtikz','-S640x480');

end
