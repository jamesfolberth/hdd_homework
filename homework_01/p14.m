%GNU Octave
function [] = p14()
   n = (2:20).^2;
   eps = sqrt(2*log(200)./n);

   plot(n,eps);
   xlabel('Dimension $n$','interpreter','tex');
   ylabel('Slab parameter $\epsilon(n)$','interpreter','tex');
   title('Slab parameter $\epsilon(n)$ as a function of dimension $n$',...
      'interpreter','tex');
   print('figures/p14.tikz','-dtikz','-S640,480');

end

function [] = p14_check()
   N = 10000;
   n = (2:20).^2;

   means = zeros([numel(n) 1]);
   vars  = zeros([numel(n) 1]);
   
   for i=1:numel(n);
      x1 = sample_sphere_proj(n(i),N,1);
      eps = sqrt(2*log(200)/n(i));
      
      fprintf(1,'n = %d, %%= %f\n',n(i),sum( x1>=-eps & x1 <= eps)/10000);
   end
end

function [xj] = sample_sphere_proj(n,N,j)
   
   xj = zeros([N 1]);
   x = zeros([n 1]);
   for i=1:N
      x = randn([n 1]);
      x /= norm(x,2);
      xj(i) = x(j);
   end
end
