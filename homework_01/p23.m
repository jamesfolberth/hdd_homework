% GNU Octave
function [] = p23()
  
   plot_minmax('bernoulli_eigs.h5','$\lambda_{min}$ and $\lambda_{max}$ for Symmetric Bernoulli Matrices','figures/p23_bernoulli.tikz')
   plot_minmax('gauss_eigs.h5','$\lambda_{min}$ and $\lambda_{max}$ for GOE Matrices','figures/p23_gauss.tikz')

end 

function [] = plot_minmax(savefile,titlestring,figurefilename)

   load(savefile);

   mineigs = zeros([N numel(n)]);
   maxeigs = zeros([N numel(n)]);
   for dim=1:numel(n)
      for i=1:N
         mineigs(i,dim) = min(evals(1:n(dim),i,dim));
         maxeigs(i,dim) = max(evals(1:n(dim),i,dim));
      end
   end

   figure()
   clf();
   hold on;
   for i=1:numel(n)
      plot(n(i)*ones([N 1]),mineigs(:,i),'x','markerfacecolor',[0 1 0],...
         'markersize',4);
      plot(n(i)*ones([N 1]),maxeigs(:,i),'x','markerfacecolor',[0 0 1],...
         'markersize',4);
   end
   hold off;

   xlabel('Dimension $n$','interpreter','tex');
   ylabel('Eigenvalues $\lambda_{min}$ and $\lambda_{max}$','interpreter','tex');
   title(titlestring);
   print(figurefilename,'-dtikz','-S640,480');

end

function [] = compute_eigs(mat_type)
   N = 100;
   n = [10 50 100 500 1000];

   if strcmp(mat_type,'bernoulli_sym')
      mat_build_cmd = @(dim) bernoulli_sym(dim,0.5);
      savefile = 'bernoulli_eigs.h5';
   elseif strcmp(mat_type,'gauss_orth')
      mat_build_cmd = @(dim) gauss_orth(dim);
      savefile = 'gauss_eigs.h5';
   else
      error('bad matrix type\n');
   end

   evals = zeros([max(n) N numel(n)]);

   for dim=1:numel(n)
      for i=1:N
         fprintf(1,'\rdim = %d i = %d',n(dim),i); fflush(1);
         X = mat_build_cmd(n(dim));
         evals(1:n(dim),i,dim) = eig(X);
      end
   end
   fprintf(1,'\n');
   
   save('-hdf5',savefile,'N','n','evals');
end
