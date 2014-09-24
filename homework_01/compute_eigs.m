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
