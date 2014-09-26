%GNU Octave
function [] = p21()
   N = 10000;
   n = (1:20).^2;

   d = zeros([numel(n)*N 1]);
   w = zeros([numel(n) 1]);
   for i=1:numel(n);
      x = sample_ball(N,n(i),sqrt(n(i)));
      d(N*(i-1)+1:N*i) = transpose(norm(x,2,'cols'));
      %disp([N*(i-1)+1 N*i])
   end

   hist(d,500)
   xlabel('Distance from origin','interpreter','tex');
   ylabel('Count','interpreter','tex')
   title('Histograms of distance from origin for various dimensions','interpreter','tex');
   print('figures/p21.tikz','-dtikz','-S1280,960');
end

function [x] = sample_ball(N,n,r)
   x = randn([n N]);
   u = rand([1 N]);
   for i=1:N
      x(:,i) /= norm(x(:,i),2);
   end
   for i=1:n
      x(i,:) =  r*u.^(1/n).*x(i,:);
   end
end
