function [ min,nbiter,iterations,exitFlag] = steepestDescent(fun,grad,start,iterMax,precision)
%Steepest Descent for multivariate Function
%   Minimizes the function using steepest descent algorithm
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%
% fun: The function to minimize
% grad: The gradient of the function (also as a function)
% Start: The vector of the starting point for the algorithm
% Optional:
% iterMax: Maximum number of steepest descent iterations before algorithm
%          is stoped Default ( 10 000)
% precision: The precision used for the stoping criteria. The criteria is
%            the absolute value of the norm of (x(k+1)-x(k))
%            Default(0.0000001)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Outputs %%%%%%%%%%%%%%%%%%%%%%%%%%%
% min: the vector that minimizes the function
% nbiter: The number of iterations it took for the algorithm to converge
% exitFlag: Boolean stating how the algorithm was stoped
%           1: The algorithm converged to a minimum
%           0: The algorithm was stoped becaused it breached the maximum
%              number of iterations without converging to a satisfying value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin<3
    error('steepestDescent:TooFewInputs', 'This function needs at least 3 inputs');
end
if nargin<4
    iterMax = 10000;
    precision = 0.0000001;
elseif nargin <5
    precision = 0.0000001;
end
iterations = [];
xk = start;
nbiter = 0;
prev = xk*2;
while abs(norm(xk-prev)) >(precision) && nbiter < iterMax
    prev = xk;
    d = -grad(xk)/norm(grad(xk));
    teta = @(L) fun(xk + L*d);
    L = fminsearch(teta,1);
    xk = xk + L*d;
    nbiter = nbiter + 1;
    iterations = [iterations xk];
end
if nbiter == iterMax
    exitFlag = 0;
else
    exitFlag = 1;
end
min = xk;
end

