clc
clear all
close all

% Objective and gradient
f = @(x) (x(1)-2)^2 + 2*(x(2)+3)^2; % Define the objective
grad_f = @(x) [2*(x(1)-2); 4*(x(2)+3)]; % Define the gradient

opt_max_iter = 100; % Maximum optimization iteration
x0 = [-5; 5]; % Initial point
alpha_0 = 1.2; % Initial alpha for backtracking

% Steepest descent 
[x_hist1, f_hist1, g_norm_hist1, funeval1] = steepest_descent(f, grad_f, x0, alpha_0, opt_max_iter);

%% Extra: Visualize!
% Generate a grid over [-5, 5] x [-5, 5]
x1 = linspace(-5, 5, 200);
x2 = linspace(-5, 5, 200);
[X1, X2] = meshgrid(x1, x2);

% Evaluate f on the grid using vectorized loop
Z = arrayfun(@(x, y) f([x; y]), X1, X2);

% Plot the contour
contour(X1, X2, Z, 30); % 30 contour levels
xlabel('x_1');
ylabel('x_2');
title('Contour plot of f(x_1, x_2) = (x_1 - 2)^2 + 2(x_2 + 3)^2');
axis equal;
grid on;

hold on
plot(x_hist1(1,:),x_hist1(2,:),'ro-')


