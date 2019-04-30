# Details
This code is used to find the root of a function using the false position method.

# Code Format
[root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)

## Inputs
func is the supplied function (use function handle)  
xl is the lower limit of the bracketing method  
xu is the upper limit of the bracketing method  
es is the minimum tolerance threshold to exit the loops used in the false position  
maxiter is the largest number of iterations before exit, assuming minimum tolerance has not been reached  

## Outputs
root is the x-value corresponding to the solution using the false position method   
fx is the evaluated function at the found root  
ea is the last evaluated error with the given root  
iter is the last iteration value that was used for the given root  

## Errors & Adjustments
function must be supplied as a function handle. If an error tolerance is not supplied, the program will default to 0.000001. The maximumum number of iterations, if not supplied, will be 200. The supplied bracket must have xl<xu.
