% GNU Octave
function [] = p5()

n = 100;

w3 = ones([n 1]);
w4 = ones([n 1]);
w3(n/4+1:3*n/4) = -1;
w3 /= sqrt(n);
w4(n/4+1:n/2) = -1;
w4(3*n/4+1:n) = -1;
w4 /= sqrt(n);

plot(1:n,w3,'o','markerfacecolor',[0 0 1]);
xlabel('$n$');
ylabel('$w_3$');
title('$w_3$ for $n = 100$');
print('figures/p5_1.tikz','-dtikz','-S640x480');

plot(1:n,w4,'o','markerfacecolor',[0 0 1]);
xlabel('$n$');
ylabel('$w_4$');
title('$w_4$ for $n = 100$');
print('figures/p5_2.tikz','-dtikz','-S640x480');

end
