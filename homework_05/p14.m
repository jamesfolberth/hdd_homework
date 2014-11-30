function [] = p14()

n = 10;
p = 0.4;
q = 0.1;
[A, T] = build_adj(n, p, q);

C = partition(transpose(T)*A*T);

end
