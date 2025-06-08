function [alpha, i] = line_search(xk, pk, f, grad_f,alpha_0)
    alpha = alpha_0; % Initial alpha
    mu1 = 1e-4; % Sufficient factor for Armijo
    mu2 = 0.9; % For strong wolfe condition
    rho = 0.5; % Backtracking factor
    max_ls_iter = 1e4; % Maximum line search iteration
    
    phi = @(alpha,xk) f(xk + alpha*pk); % Single variable function for line search
    phi_prime = @(alpha,xk,pk) grad_f(xk + alpha*pk)' * pk; % For gradient calculation
    phi_0 = phi(0,xk);
    phi_prime_0 = phi_prime(0,xk,pk);

    for i = 1:max_ls_iter
        phi_eval = phi(alpha,xk); % Evaluate phi for Armijo
        phi_prime_alpha = phi_prime(alpha,xk,pk); % Evaluate phi_prime for Wolfe

        % Check Armijo and strong Wolfe condition
        armijo_check = (phi_eval< phi_0 + mu1 * alpha * phi_prime_0);
        wolfe_check = (abs(phi_prime_alpha)< mu2*abs(phi_prime_0));
        
        % If both conditions are fulfilled, break from the loop
        if (armijo_check == 1)  && (wolfe_check == 1)
            break
        end
        
        % If not, backtrack
        alpha = rho*alpha;
    end
       
end
