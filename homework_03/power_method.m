function [vt,e,vresid] = power_method(A)
% use the power method to estimate the dominant left eigenvector of A

max_iter = 2000;
eps = 1e-8;
vresid = [];

vt = rand([1 size(A,1)]);
vt_old = vt;
zt = vt*A;
for i=1:max_iter
   nzt = norm(zt,2);
   vt = zt / nzt;
   
   resid = norm(vt-vt_old,2)/norm(vt,2);
   fprintf(1,'\rresid = %e',resid);
   vresid = [vresid; resid];
   if resid < eps
      break
   end
   vt_old = vt;
   
   zt = vt*A;
end
fprintf(1,'\n');

e = zt*transpose(vt);
end
