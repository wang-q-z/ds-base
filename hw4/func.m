function fval = func(xvec)
    Q = [3.65 0.37;
        0.37 5.84];
    b = [1.2;4];
    fval = (1/4).*xvec'*Q*xvec + b'*xvec;
