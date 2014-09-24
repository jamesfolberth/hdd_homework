function [X] = gauss_orth(n)
   X = zeros([n n]);

   X(1,1) = sqrt(2)*randn([1 1]);
   for i=2:n
      X(1:i-1,i) = randn([i-1 1]);
      X(i,1:i-1) = transpose(X(1:i-1,i)); % fill in lower triangle
      X(i,i) = sqrt(2)*randn([1 1]); % diagonal sampled from N(0,2)
   end
end
