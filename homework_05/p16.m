function [] = p16()

load p16_data.mat;

beta_plot = linspace(1, 50, 100);
alpha_plot = zeros(size(beta_plot));
for i = 1:numel(beta_plot)
   alpha_plot(i) = (1+beta_plot(i)*log(300)+sqrt(1+4*beta_plot(i)*log(300)))...
      / log(300);
end

hold on
alpha = 5:50; beta = 1:50;
imagesc(beta, alpha, score);
colorbar()
colormap(gray)

plot(beta_plot, alpha_plot, 'r', 'linewidth', 4);
hold off
axis([1 50 5 50])
set(gca, 'YDir', 'reverse')
xlabel('$\beta$')
ylabel('$\alpha$')
title('Dense Communities');

print('figures/p16.tikz','-dtikz','-S640x480');

end
