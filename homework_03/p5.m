% GNU Octave
function [] = p5()
persistent H indeg outdeg

pkg load optim;

if isempty(H)
   H = loadlinks();

   indeg = zeros([size(H,1) 1]);
   outdeg = zeros([size(H,1) 1]);
   for i=1:size(H,1)
      indeg(i) = nnz(H(:,i));
      outdeg(i) = nnz(H(i,:));
   end
end

xin = 1:max(indeg);
[nin] = hist(indeg, xin);
nin = nin / sum(nin);
loglog(xin, nin, 'o') 

% fit line
hold on
nfit = nin(2:75);
xfit = xin(2:75);
[f,p,cvg,iter,corp,covp] = leasqr(xfit, nfit, [1; 2.5],...
   @(x_,p_) fitme(x_,p_));
p
loglog(xfit, f, 'r');
hold off

xlabel('degree');
ylabel('In-degree $f_i(d)$');
title('Relative fractions of in-degrees')
print('figures/p5_in.tikz','-dtikz','-S640x480');

figure()
xout = 1:max(outdeg);
[nout] = hist(outdeg, xout);
nout = nout / sum(nout);
loglog(xout, nout, 'o') 

% fit line
hold on
nfit = nout(4:40);
xfit = xout(4:40);
[f,p,cvg,iter,corp,covp] = leasqr(xfit, nfit, [0.27025; 2.5],...
   @(x_,p_) fitme(x_,p_), 10^-6, 20);
p
loglog(xfit, f, 'r');
hold off

xlabel('degree');
ylabel('Out-degree $f_o(d)$');
title('Relative fractions of out-degrees')
print('figures/p5_out.tikz','-dtikz','-S640x480');

disp([full(min(indeg)) full(max(indeg))]);
disp([full(min(outdeg)) full(max(outdeg))]);

end % p5

function [y] = fitme(x,p)
   y = p(1)*x.^(-p(2));
end
