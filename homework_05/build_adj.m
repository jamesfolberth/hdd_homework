function [A, T, omega] = build_adj(n, p, q)

if exist('OCTAVE_VERSION','builtin')
   pkg load statistics;
end

if mod(n,2) == 1
   error('Input matrix size must be even');
end

n2 = n/2;

P   = random('bino', 1, p, n2, n2); % upper left block
dP2 = random('bino', 1, p, n2, 1); % diagonal of lower right block
Q   = random('bino', 1, q, n2, n2); % upper right block

% carve the two triangular and diagonal matrices that we need
U = triu(P, 1);
L = tril(P, -1);
dP = diag(P);

A = [U + transpose(U) + diag(dP), Q;
     transpose(Q), L + transpose(L) + diag(dP2)];

I = eye(n);
ix = randperm (n);
T = I(ix,:);
T = I;

A = T*A*transpose(T);

if nargout == 3
   Omega = [ones([n2 n2]) zeros([n2 n2]);
            zeros([n2 n2]) -ones([n2 n2])];
   Omega = T*Omega*transpose(T);

   omega = ones([n 1]);
   c2inds = find(Omega == -1);
   for i = 1:numel(c2inds)
      omega(ind2sub([n n],c2inds(i))) = -1;
   end

end

end
