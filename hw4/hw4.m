clear all;
Q = [3.65 0.37;
        0.37 5.84];
b = [1.2;4];

%Q1 可视化
x1 = -3:.1:3;
x2 = -3:.1:3;
[X1, X2] = meshgrid(x1, x2);
for i = 1:size(X1,1)
    for j = 1:size(X2,1)
        F(i,j) = func([X1(i,j); X2(i,j)]);
    end
end
surf(X1, x2, F)

%Q2 gradient descent

%% 

%Exact Line Search
xvec = [1;1];
iter = 100;
for i = 1:iter
    temp = 0.5*Q'*xvec + b;
    grad = [temp(1);temp(2)];
    t = fminbnd(@(tau) func(xvec - tau*grad), 0, 1);
    xvec = xvec - t * grad;

    if norm(grad, 2) < 1e-6
        xopt = xvec;  
        fopt = func(xvec);  
        break;
    end

end

%% 
% Backtracking Line Search

xvec1 = [1;1];
iter1 = 100;
for i = 1:iter1
    temp1 = 0.5*Q'*xvec1 + b;
    grad1 = [temp1(1);temp1(2)];
    
    t = 1;
    alpha = 0.4; beta = 0.58;
    fval = func(xvec1);
    while 1
        xvec_t = xvec1 - t * grad1;
        ftemp = func(xvec_t);
        if ftemp - fval < alpha * t * grad1' * (-grad1)
             xvec1 = xvec_t;
            break
        else
            t = t * beta;
        end
    end
     if norm(grad1, 2) < 1e-6
        xopt1 = xvec1; 
        fopt1 = func(xvec1);  
    end
end



