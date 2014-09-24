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
