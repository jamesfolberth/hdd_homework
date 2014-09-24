%GNU Octave
function [] = p16()
   n = 1:400;
   N = 10000;

   for i=1:numel(n)
      fprintf(1,'\r%d',i);fflush(1); % print index to screen; octave JIT 
                                     % compiler not enabled
      sample_ball(N,n(i),sqrt(n(i)));
   end
   fprintf(1,'\n');

end

function [] = sample_ball(N,n,r)
   
   x = zeros([n 1]);
   for i=1:N
      x = randn([n 1]);
      x *= r*rand()^(1/n)/norm(x,2);
   end
end
