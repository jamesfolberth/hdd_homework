%GNU Octave
function [] = p18()
   N = 10000;
   n = (2:20).^2;

   means = zeros([numel(n) 1]);
   vars = means;
   for i=1:numel(n);
      x1 = sample_ball_proj(N,n(i),sqrt(n(i)),1);
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
   print('figures/p18_mean.tikz','-dtikz','-S640,480');

   clf();
   loglog(n,vars,'o','markerfacecolor',[0,0,1],'markersize',4)
   axis([1 400 .1 1.1]);
   xlabel('$n$','interpreter','tex');
   ylabel('Sample variance of $x_1$','interpreter','tex')
   title('Sample variance of $x_1$ vs. Dimension $n$','interpreter','tex');
   print('figures/p18_var.tikz','-dtikz','-S640,480');
end
