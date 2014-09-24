function [] = sample_ball(N,n,r)
   
   x = zeros([n 1]);
   for i=1:N
      x = randn([n 1]);
      x *= r*rand()^(1/n)/norm(x,2);
   end
end
