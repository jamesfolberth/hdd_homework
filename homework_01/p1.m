function [] = p1(N,n)
   r = 1.;
   X = zeros([n N]);
   for i=1:N
      x = r*(1.-2.*rand([n 1]));
      if norm(x,2) <= r
         X(:,i) = x;
      %else
         % generate a new x
      end
   end
end
