% GNU Octave
function [] = p25()

   plot_esd('bernoulli_sym_eigs.h5','ESD for symmetric Bernoulli ensemble','figures/p25_bernoulli')
   plot_esd('gauss_orth_eigs.h5','ESD for Gaussian orthogonal ensemble','figures/p25_gauss')

end 

function [] = plot_esd(savefile,titlestring='',figurefilename='')

   load(savefile);

   for i=1:numel(n)
      esd_data = evals(1:n(i),:,i)(:)/sqrt(n(i));
    
      [f,x] = hist(esd_data,50);
      area = trapz(x,f); 
      
      clf()
      hold on;
         bar(x,f/area);
         plot(x,1/(2*pi)*sqrt(4-x.^2));
      hold off;

      xlabel('$\lambda_i/\sqrt{n}$','interpreter','tex');
      title(titlestring,'interpreter','tex');
      print(sprintf('%s_%d.tikz',figurefilename,n(i)),'-dtikz','-S640,480');
   end
end
