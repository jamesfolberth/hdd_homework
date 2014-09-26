% GNU Octave
function [] = p26_scatter()
   %pkg load statistics; % hist3

   plot_eigs('bernoulli_eigs.h5','ESD for Bernoulli ensemble','figures/p26_bernoulli')
   plot_eigs('gauss_eigs.h5','ESD for Gaussian orthogonal ensemble','figures/p26_gauss')

end 

function [] = plot_eigs(savefile,titlestring='',figurefilename='')

   load(savefile);

   for i=1:numel(n)
      % downsample scatter plot
      plot(real(evals(1:n(i),:,i)(1:i:end)/sqrt(n(i))),...
         imag(evals(1:n(i),:,i)(1:i:end)/sqrt(n(i))),...
         'o','markerfacecolor',[0 0 1],'markersize',1);
      axis('equal');

      xlabel('$\Re(\lambda_i/\sqrt{n})$','interpreter','tex');
      ylabel('$\Im(\lambda_i/\sqrt{n})$','interpreter','tex');
      title(titlestring,'interpreter','tex');
      print(sprintf('%s_scatter_%d.tikz',figurefilename,n(i)),'-dtikz','-S640,480');
   end
end
