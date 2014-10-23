% GNU Octave
function [] = p3()
 
   K = 2; % == dim manifold
   %x1 = [.3; .3]; % w_{ij} \ge 0
   x1 = [0; .3];
   X = [x1 [.1;.1] [1;0]];

   G = zeros([K K]);
   for i=2:K+1
      for j=2:K+1
         G(i-1,j-1) = dot(X(:,i) - X(:,1), X(:,j) - X(:,1));
      end
   end

   % find w_{ij}
   [L,U,p] = lu(G,'vector'); % don't need to permute constant vector
   temp = linsolve(L,ones([K 1]),struct('LT',1));
   wtil = linsolve(U,temp,struct('UT',1)); 
   w = wtil/sum(wtil);
   w
  
   % find approximation
   x1_approx = w(1)*X(:,2) + w(2)*X(:,3);
   %norm(x1-x1_approx,2)
   
   close all
   figure
   clf
   hold on
   plot(X(1,2:end),X(2,2:end),'o','markersize',10,'markerfacecolor',[0 0 1]);
   plot(X(1,1),X(2,1),'o','markersize',10,'markerfacecolor',[0 1 0]);
   plot(x1_approx(1),x1_approx(2),'o','markersize',10,'markerfacecolor',[1 0 0]);
   text(x1_approx(1)+.025,x1_approx(2),'A');
   text(X(1,2)+.025,X(2,2),'$x_1$');
   text(X(1,3)-.025,X(2,3)+.025,'$x_2$');
   text(X(1,1)+.025,X(2,1),'$x_i$');
   hold off

   title('LLE in $\reals^2$','interpreter','tex');
   xlabel('Coordinate 1','interpreter','tex');
   ylabel('Coordinate 2','interpreter','tex');
   print('figures/p3.tikz','-dtikz','-S640x480');

end
