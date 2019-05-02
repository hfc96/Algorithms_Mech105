function [root, fx, ea, iter] = falsePosition(func, xl,xu,es, maxiter)

format long

%check if the function has been entered with the error tolerance
if ~exist('es', 'var') || isempty(es)
    es = 0.0001/100;
end

%initialize values for breaking out of function, tolerance levels
iter = 0;
tol = 10;
ea = 1;

%start with initialized value for comparison
x_old = 0;

%while loop continues if the tolerance is above threshold and iteration is
%below 200
while tol > es && iter < maxiter
    
    %false position algorithm
    x_new = (xl*func(xu)-xu*func(xl))./(func(xu)-func(xl));
    
    tol = abs((x_new - x_old)/x_new);
    x_old = x_new;
    
    %replace lower limit, or found root, or upperlimit based on algorithm
    %sign check
    if sign(func(x_new))*sign(func(xu)) < 0
        xl = x_new;
    else if sign(func(x_new)) == 0
        root = x_new;
        ea = tol;
        fx = func(x_new);
        else
            xu = x_new;
        end
    end
    
    iter = iter +1;

    
end

%if the root was not yet found by the 200th iteration, update the root to
%be the latest value
if ~exist('root','var') || isempty(root)
   root = x_new;
   ea = tol;
   fx = func(x_new);
end

end

