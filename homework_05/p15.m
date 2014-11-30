function [] = p15()

n = 300;
p = 0.1;
q = 0.9;
[A, T, omega] = build_adj(n, p, q);

C = partition(A);
[o, omega_til] = overlap(omega, C);
%disp([omega omega_til]);

o

spy(A)

end
