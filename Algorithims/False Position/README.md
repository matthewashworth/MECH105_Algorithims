# False Position Calculator
Estimates the root of an imputed function with inital guesses that bracket the actual root. Uses the iterative method of False Position
## Inputs
func- the function that will be evaluated in, requires the form @(x) function (example: @(x) x^3)\
xl- lower inital guess of the root\
xu- upper inital guess of the root\
### Optional imputs
es- desired relative error for the root (will default at 0.0001%)\
maxit- desired maximum iterations of the function (will default at 200 iterations)\
## Outputs
root- estimated root \
fx- the function evaluated\
ea- the relative error of the guess\
iter- numer of iteration the function ran\
