function [ min] = NewtonMultiDim(fun,grad,hess,start )
%NEWTONMULTIDIM Summary of this function goes here
%   Detailed explanation goes here
xk = start;
nbiter = 0;
prev = xk*2;
itermax = 20000;
while abs(norm(xk-prev)) >(0.0000000001) && nbiter < itermax
    prev = xk;
    xk = xk - hess(xk)\grad(xk);
    nbiter = nbiter + 1;
end
if nbiter == itermax
    fprintf('Exited cuz of iterations\n');
end
fprintf('Convergence apres %i iterations\n',nbiter);
disp(xk);
end

