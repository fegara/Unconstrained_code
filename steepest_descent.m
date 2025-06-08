function [x_hist, f_hist, g_norm_hist,funeval] = steepest_descent(f, grad_f, x0, alpha_0, opt_max_iter)
% STEEPEST_DESCENT: Performs steepest descent optimization with line search.
norm_tol = 1e-6; % Norm tolerance
xk = x0; % Initial point
x_hist = xk; % History of x
f_hist = f(xk); % History of f(x)
gk = grad_f(xk); % Evaluate the first gradient
g_norm_hist =  norm(gk); % History of gradient 
funeval = 1; % How many functions are called

for k = 1:opt_max_iter
    pk = -gk;  % First step, steepest descent
 
    [alpha, ls_iter] = line_search(xk, pk, f, grad_f, alpha_0); % Perform line search
    xk = xk + alpha * pk; % Update xk after alpha was found
    gk = grad_f(xk); % Gradient at new xk

    % Save history
    x_hist(:, end+1) = xk;
    f_hist(end+1) = f(xk);
    g_norm_hist(end+1) = norm(gk);
    funeval = funeval+ls_iter;
    if norm(gk) < norm_tol
        break;
    end
    
end

