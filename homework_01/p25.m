% GNU Octave
function [] = p25()

   plot_esd('bernoulli_sym_eigs.h5','ESD for symmetric Bernoulli ensemble','figures/p25_bernoulli.tikz')
   plot_esd('gauss_orth_eigs.h5','ESD for Gaussian orthogonal ensemble','figures/p25_gauss.tikz')

end 

function [] = plot_esd(savefile,titlestring='',figurefilename='')

   load(savefile);

   % accumulate all evals into a vector
   esd_data = zeros([sum(n)*N 1]);
   acc = 0;
   for i=1:numel(n)
      esd_data(acc+1:acc+n(i)*N) = evals(1:n(i),:,i)(:)/sqrt(n(i));
      acc += n(i)*N;
   end
   
   [f,x] = hist(esd_data,50);
   area = trapz(x,f); 
   
   clf()
   hold on;
      bar(x,f/area);
      plot(x,1/(2*pi)*sqrt(4-x.^2));
   hold off;

   xlabel('\lambda_i/\sqrt{n}','interpreter','tex');
   title(titlestring,'interpreter','tex');
   print(figurefilename,'-dtikz','-S640,480');
end
