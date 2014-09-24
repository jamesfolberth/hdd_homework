function [X] = bernoulli_sym(n,p)
   X = zeros([n n]); % assume square
  
   u = zeros([n 1]);
   for i=1:n;
      X(1:i,i) = -1;
      u(1:i) = rand([i 1]);
      X(1:i,i) += 2*(u(1:i)>= p);
      X(i,1:i) = transpose(X(1:i,i)); % fill in lower triangle
   end
end
