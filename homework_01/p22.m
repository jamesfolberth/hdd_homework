% GNU Octave
function [] = p22()
  
   B = gauss_orth(400,0.5);
   X = gauss_orth(400);

end 

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

function [X] = gauss_orth(n)
   X = zeros([n n]);

   X(1,1) = sqrt(2)*randn([1 1]);
   for i=2:n
      X(1:i-1,i) = randn([i-1 1]);
      X(i,1:i-1) = transpose(X(1:i-1,i)); % fill in lower triangle
      X(i,i) = sqrt(2)*randn([1 1]); % diagonal sampled from N(0,2)
   end

end
