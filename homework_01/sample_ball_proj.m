function [xj] = sample_ball_proj(N,n,r,j)
   
   xj = zeros([N 1]);
   x = zeros([n 1]);
   for i=1:N
      x = randn([n 1]);
      x *= r*rand()^(1/n)/norm(x,2); % don't need to compute all of x
      xj(i) = x(j);
   end
end
