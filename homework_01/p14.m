%GNU Octave
function [] = p14()
   N = 10000;
   n = (2:20).^2;
   eps = sqrt(2*log(200)./n);
 
   eps_empirical = zeros([numel(n) 1]);
   for i=1:numel(n)
      fprintf(1,'i=%d\n',i); fflush(1);
      x1 = sample_sphere_proj(n(i),N,1);
      x1_sort = sort(x1);
      %eps_empirical(i) = (abs(x1_sort(1+floor(0.005*N))) +...
      %   abs(x1_sort(end-ceil(0.005*N))))/2;
      eps_empirical(i) = max(abs(x1_sort(1+floor(0.005*N))),...
         abs(x1_sort(end-ceil(0.005*N))));
 
   end



   plot(n,eps,n,eps_empirical,'o','markerfacecolor',[0 0 1],'markersize',4);
   xlabel('Dimension $n$','interpreter','tex');
   ylabel('Slab parameter $\epsilon(n)$','interpreter','tex');
   title('Slab parameter $\epsilon(n)$ as a function of dimension $n$ with emipirical data',...
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
