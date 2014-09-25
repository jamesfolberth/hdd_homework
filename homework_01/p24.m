% GNU Octave
function [] = p24()
   pkg load optim; % leasqr

   plot_minmax_fit('bernoulli_sym_eigs.h5','$\lambda_{min}$ and $\lambda_{max}$ for Symmetric Bernoulli Matrices','figures/p24_bernoulli.tikz')
   plot_minmax_fit('gauss_orth_eigs.h5','$\lambda_{min}$ and $\lambda_{max}$ for GOE Matrices','figures/p24_gauss.tikz')

end 

function [] = plot_minmax_fit(savefile,titlestring,figurefilename)

   load(savefile);

   mineigs = zeros([N numel(n)]);
   maxeigs = zeros([N numel(n)]);
   for dim=1:numel(n)
      for i=1:N
         mineigs(i,dim) = min(abs(evals(1:n(dim),i,dim)));
         maxeigs(i,dim) = max(abs(evals(1:n(dim),i,dim)));
      end
   end
   
   [f_min,p_min] = leasqr(n,mineigs(:),[1;1;-0.5],...
      @(x_,p_) fit_objective(x_,p_,n,N));
   [f_max,p_max] = leasqr(n,maxeigs(:),[1;1;0.5],...
      @(x_,p_) fit_objective(x_,p_,n,N));

   p_min
   p_max

   figure()
   clf();
   hold on;
   for i=1:numel(n)
      semilogy(n(i)*ones([N 1]),mineigs(:,i),'x','markerfacecolor',[0 1 0],...
         'markersize',4);
      semilogy(n(i)*ones([N 1]),maxeigs(:,i),'x','markerfacecolor',[0 0 1],...
         'markersize',4);
   end
   %n_rep = repelems(n,[1:numel(n);repmat([N],[1 numel(n)])]);
   n_rep = linspace(min(n),max(n),numel(mineigs));
   semilogy(n_rep,p_min(2)*(n_rep+p_min(1)).^(p_min(3)),'g');
   semilogy(n_rep,p_max(2)*(n_rep+p_min(1)).^(p_max(3)),'g');
   hold off;

   axis([10 1000 10^-4 10^2]);
   xlabel('Dimension $n$','interpreter','tex');
   ylabel('Eigenvalues $\lambda_{min}$ and $\lambda_{max}$','interpreter','tex');
   title(titlestring,'interpreter','tex');
   print(figurefilename,'-dtikz','-S640,480');

end

function [y] = fit_objective(x,p,n,N_sample)
   y = zeros([N_sample*numel(n) 1]);
   for i=1:numel(n)
      y(N_sample*(i-1)+1:N_sample*i) = p(2)*(x(i)+p(1)).^(p(3));
   end
end
