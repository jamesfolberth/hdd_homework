function [] = p18()

load zachary.mat

omega = ones([34 1]);
omega([9 10 31 33 34 16 15 23 19 21 30 27 24 29 32 28 26 25]) = -1;

C = partition(A);
[o, omega_til] = overlap(omega, C);

disp([transpose(1:34) omega omega_til])
o

end
