function [C] = partition(A)

opts = struct('issym', 1, 'isreal', 1);
[V,D] = eigs(A, 2, 'la', opts);
v2 = V(:,2);
%[V,D] = eig(A);
%if ~issorted(diag(D))
%    [V,D] = eig(A);
%    [D,I] = sort(diag(D));
%    V = V(:, I);
%end
%v2 = V(:,end-1);

C = zeros([size(A,1) 2]);
C(:,1) = v2>0;
C(:,2) = v2<=0;

end
