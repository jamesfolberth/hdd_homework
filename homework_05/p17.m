function [] = p17()

load p17_data.mat;

beta_plot = linspace(1, 50, 100);
alpha_plot = zeros(size(beta_plot));
for i = 1:numel(beta_plot)
   alpha_plot(i) = (1+beta_plot(i)+sqrt(1+4*beta_plot(i)));
end

hold on
alpha = 5:70; beta = 1:50;
imagesc(beta, alpha, score);
colorbar()
colormap(gray)

plot(beta_plot, alpha_plot, 'r', 'linewidth', 4);
hold off
axis([1 50 5 70])
set(gca, 'YDir', 'reverse')
xlabel('$b$')
ylabel('$a$')
title('Sparse Communities');

print('figures/p17.tikz','-dtikz','-S640x480');

end
