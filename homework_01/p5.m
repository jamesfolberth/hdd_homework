%GNU Octave
function [] = p5()
   N = 10000;
   n = (2:20).^2;

   stats = zeros([numel(n) 2]);
   for i=1:numel(n)
      X = randn([n(i) N]);
      nrmx = norm(X,2,'cols');
      stats(i,1) = mean(nrmx);
      stats(i,2) = var(nrmx);
   end
   
   plot(n,stats(:,1),'o','markerfacecolor',[0,0,1],'markersize',4,...
      1:1:400,sqrt(1:1:400))
   axis([-10 420 0 21])
   h = legend('Sample mean','$\sqrt{n}$','location','northwest');
   set(h,'interpreter','TeX','fontsize',8);
   xlabel('Dimension $n$','interpreter','TeX');
   ylabel('Sample mean');
   title('Mean of $\|x\|$ vs. dimension $n$','interpreter','TeX');
   print('figures/p5_mean.tikz','-dtikz','-S640,480');

   clf()
   plot(n,stats(:,2),'o','markerfacecolor',[0,0,1],'markersize',4)
   axis([-10 420 0 .6]);
   xlabel('Dimension $n$','interpreter','TeX');
   ylabel('Sample variance');
   title('Variance of $\|x\|$ vs. dimension $n$','interpreter','TeX');
   print('figures/p5_var.tikz','-dtikz','-S640,480');
end
