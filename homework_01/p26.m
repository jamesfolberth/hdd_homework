% GNU Octave
function [] = p26()
   pkg load statistics; % hist3

   plot_eigs('bernoulli_eigs.h5','ESD for Brnoulli ensemble','figures/p26_bernoulli')
   plot_eigs('gauss_eigs.h5','ESD for Gaussian orthogonal ensemble','figures/p26_gauss')

end 

function [] = plot_eigs(savefile,titlestring='',figurefilename='')

   load(savefile);

   for i=1:numel(n)
      %plot(real(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   imag(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   'o','markerfacecolor',[0 0 1],'markersize',4);
     
      %hist3([real(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   imag(evals(1:n(i),:,i)(:)/sqrt(n(i)))], [50 50]);
      [values, centers] = hist3([real(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
         imag(evals(1:n(i),:,i)(:)/sqrt(n(i)))], [75 75]);
      
      volume = trapz(transpose(centers{1}),...
         trapz(ones([size(values,1) 1])*centers{2},values,2),1);
      imagesc(values/volume);
      colorbar();
      axis('equal');

      %plot3(real(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   imag(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   abs(evals(1:n(i),:,i)(:)/sqrt(n(i))),...
      %   'o','markerfacecolor',[0 0 1],'markersize',4);

      xlabel('$\Re(\lambda_i/\sqrt{n})$','interpreter','tex');
      ylabel('$\Im(\lambda_i/\sqrt{n})$','interpreter','tex');
      title(titlestring,'interpreter','tex');
      print(sprintf('%s_%d.tikz',figurefilename,n(i)),'-dtikz','-S640,480');
   end
end
