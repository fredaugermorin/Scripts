function [ surfaceMat ] = computeSurfMatrix(fun,x,y)
% computeSurfMatrix 
%   Computes the matrix needed to represent the surface of
%   the function fun
%% Inputs
% fun: the name of the multivariate function to represent
% x: the x range on which to represent fun
% y: the y range on which to represent fun
%% Outputs
% surfaceMat: The matrix of the function for use with Matlab's surf(x,y,Z)

%Preallocation
surfaceMat = zeros(size(x*y'));
for i = 1:length(x)
    for j =1:length(y)
        surfaceMat(i,j) = fun([x(i),y(j)]);
    end
end
end

