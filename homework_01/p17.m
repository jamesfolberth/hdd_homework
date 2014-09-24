%GNU Octave
function [] = p17()
   N = 10000;
   n = [4 25 100 225 400];

   for i=1:numel(n);
      x1 = sample_ball_proj(N,n(i),sqrt(n(i)),1);
      means(i) = mean(x1);
      vars(i)  = var(x1);
      
      hist(x1,50)
      bound = max(abs(xlim()));
      axis([-bound bound]) % make axes symmetric
      xlabel('$x_1$','interpreter','TeX');
      ylabel('Count','interpreter','TeX');
      title(strcat('Histogram of $x_1$ for $10000$ samples with $n = ',...
         sprintf('%d$.',n(i))),'interpreter','TeX');
      print(sprintf('figures/p17_%d.tikz',n(i)),'-dtikz','-S640,480');
 
   end
end

function [xj] = sample_ball_proj(N,n,r,j)
   
   xj = zeros([N 1]);
   x = zeros([n 1]);
   for i=1:N
      x = randn([n 1]);
      x *= r*rand()^(1/n)/norm(x,2); % don't need to compute all of x
      xj(i) = x(j);
   end
end
