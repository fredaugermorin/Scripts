clc;clear all;
%% Fonction 1
fun1 = @(x) (x(1)-2)^4+(x(1)-2*x(2))^2;
grad1 = @(x) [4*(x(1)-2)^3+2*(x(1)-2*x(2));-4*(x(1)-2*x(2))];
hess1 = @(x) [12*(x(1)-2)^2+2 , -4 ; -4 , 8];
deb = [0.5;0.5];
%Optimization (min) par Steepest Descent (Gradient Descent)
fprintf('Fonction 1: Steepest Descent Gradient\n');
[min,nb,list,mess]=steepestDescent(fun1,grad1,deb);
if mess
    fprintf('Steepest Descent a converge apres %i iterations.\n',nb);
    fprintf('Le min est en ');disp(min');
else
    fprintf('Non Convergence de Steepest Descent');
end
%Optimization (min) par Newton Mutlidimensional
fprintf('Fonction 1: Newton Multi dim\n');
NewtonMultiDim(fun1,grad1,hess1,deb);
plot(list(1,:),list(2,:),'*');xlabel('x1');ylabel('x2');
iterFunctionRes = zeros(1,length(list));
for i=1:length(list)
    iterFunctionRes(i) = fun1(list(:,i));
end
figure;
plot3(list(1,:),list(2,:),iterFunctionRes,'w*');
hold on;
x=-1:.1:3;y=-1:.1:3;
myMatFun1 = computeSurfMatrix(fun1,x,y);
surf(x,y,myMatFun1);
hold off;
%% Fonction 2
fun2 = @(x) (x(1)-2)^2+(x(1)-2*x(2))^2;
grad2 = @(x) [2*(x(1)-2)+2*(x(1)-2*x(2)); -4*(x(1)-2*x(2))];
hess2 = @(x) [4,-4;-4,8];
%Optimization (min) par Steepest Descent (Gradient Descent)
fprintf('Fonction 2: Steepest descent Gradient\n');
[min2,nb2,list2,mess2]=steepestDescent(fun2,grad2,deb);
if mess2
    fprintf('Steepest Descent a converge apres %i iterations.\n',nb2);
   fprintf('Le min est en ');disp(min2');
else
    fprintf('Non Convergence de Steepest Descent');
end
%Optimization (min) par Newton Mutlidimensional
fprintf('Fonction 2: Newton Multi dim\n');
NewtonMultiDim(fun2,grad2,hess2,deb);