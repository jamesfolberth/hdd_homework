%GNU Octave
function [] = p19()
   N = 10000;
   n = (2:20).^2;

   w = zeros([numel(n) 1]);
   for i=1:numel(n);
      x1 = sample_ball_proj(N,n(i),sqrt(n(i)),1);
      w(i) = sum(x1>=-1/2 & x1<=1/2);
   end
   w /= N;

   plot(n,w,'o','markerfacecolor',[0,0,1],'markersize',4)
   axis([1 400 0.36 0.41]);
   set(gca(),'yminortick','on');
   xlabel('$n$','interpreter','tex');
   ylabel('Relative volume $w(n)$','interpreter','tex')
   title('Relative volume of points in slab vs. Dimension $n$','interpreter','tex');
   print('figures/p19.tikz','-dtikz','-S640,480');
end
