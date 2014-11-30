function [] = p16_comp()

n = 300;
alpha = 5:1:50;
beta  = 1:1:50;
num_samples = 20;

score = zeros([numel(alpha) numel(beta)]);
for a = 1:numel(alpha)
   for b = 1:numel(beta)
      p = alpha(a)*log(n)/n;
      q = beta(b)*log(n)/n;

      accum = 0;
      for i = 1:num_samples
         fprintf(1, '\r[alpha beta i] = [%d %d %d]          \r',...
            alpha(a), beta(b), i); fflush(1);
         [A, T, omega] = build_adj(n, p, q);
         C = partition(A);
         accum = accum + overlap(omega, C);
      end

      score(a,b) = accum/num_samples;
   end
end
fprintf(1, '\n');

save('p16_data.mat','score');

end
