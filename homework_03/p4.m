% GNU Octave
function [] = p4(savefile='rankings.mat')
load(savefile)

for i=1:numel(alpha)
   semilogy(1:numel(resids{i}),resids{i})
   xlabel('Iterations');
   ylabel('Log Relative Error');
   title('Relative Error vs. Iterations for Power Method');
   print(sprintf('figures/p4_%d.tikz',i),'-dtikz','-S640x480');

   % estimate slope
   n = numel(resids{i});
   start = ceil(0.15*n);
   slope = (log10(resids{i}(end))-log10(resids{i}(start))) / (n - start);
   fprintf(1,'alpha = %f    slope = %f\n',alpha(i), slope);
end

end
