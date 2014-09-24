% GNU Octave
function [] = p2()
   n = 1:400;
   num_rejects = zeros(size(n));
   for i=1:numel(n)
      num_rejects(i) = rejection_counter(10000,n(i));
   end

   loglog(n,num_rejects);
   axis([1,400,1000,10000*1.5]);
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
