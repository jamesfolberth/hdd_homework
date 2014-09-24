%GNU Octave
function [] = p13()
   N = 10000;
   n = (2:20).^2;

   means = zeros([numel(n) 1]);
   vars  = zeros([numel(n) 1]);
   
   for i=1:numel(n);
      x1 = sample_sphere_proj(n(i),N,1);
      means(i) = mean(x1);
      vars(i)  = var(x1);
   end

   clf();
   plot(n,means,'o','markerfacecolor',[0,0,1],'markersize',4)
   bound = max(abs(ylim()));
   axis([n(1) n(end) -bound bound]);
   xlabel('$n$','interpreter','tex');
   ylabel('Sample mean of $x_1$','interpreter','tex')
   title('Sample mean of $x_1$ vs. Dimension $n$','interpreter','tex');
   print('figures/p13_mean.tikz','-dtikz','-S640,480');

   clf();
   loglog(n,vars,'o','markerfacecolor',[0,0,1],'markersize',4)
   xlabel('$n$','interpreter','tex');
   ylabel('Sample variance of $x_1$','interpreter','tex')
   title('Sample variance of $x_1$ vs. Dimension $n$','interpreter','tex');
   print('figures/p13_var.tikz','-dtikz','-S640,480');
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
