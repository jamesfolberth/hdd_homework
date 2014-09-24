function [] = main()

p5()

end

%GNU Octave
function [] = p5()
   N = 10000;
   n = (1:20).^2;

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

% GNU Octave
function [] = p4()
   N = 10000;
   n = [4,25,100,225,400];

   for i=1:numel(n)
      X = randn([n(i) N]);
      nrmx = norm(X,2,'cols');
      
      hist(nrmx,50)
      xlabel('$\|x\|$','interpreter','TeX');
      ylabel('Count','interpreter','TeX');
      title(strcat('Histogram of $\|x\|$ for $10000$ samples with $n = ',...
         sprintf('%d$.',n(i))),'interpreter','TeX');
      print(sprintf('figures/p4_%d.tikz',n(i)),'-dtikz','-S640,480');
   end
end

function [] = p3()
   N = 10000;
   n = (1:19).^2;

   for i=1:numel(n)
      X = randn([n(i),N]);
   end
end

% GNU Octave
function [] = p2()
   n = 1:400;
   num_rejects = zeros(size(n));
   for i=1:numel(n)
      num_rejects(i) = rejection_counter(10000,n(i));
   end

   loglog(n,num_rejects);
   xlabel('Dimension n','interpreter','TeX');
   ylabel('Number of rejections', 'interpreter', 'TeX');
   title('Number of rejections vs. Dimension','interpreter','TeX');
   print('figures/p2.tikz','-dtikz','-S640,480');
end

function [num_rejects] = rejection_counter(N,n)
   r = 1.;
   num_rejects = 0;
   for i=1:N
      x = r*(1.-2.*rand([n 1]));
      if norm(x,2) <= r
         % store x, if needed
      else
         % generate a new x
         num_rejects = num_rejects+1;
      end
   end
end

function [] = p1(N,n)
   r = 1.;
   X = zeros([n N]);
   for i=1:N
      x = r*(1.-2.*rand([n 1]));
      if norm(x,2) <= r
         X(:,i) = x;
      %else
         % generate a new x
      end
   end
end
