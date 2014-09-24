% GNU Octave
function [X] = bernoulli(n,p)
   X = -ones([n n]); % assume square
   X += 2*(rand([n n])>=p);
end
