function area= simpson()
    a = 0;
    b = 4;
    dt = 0.005;
    t = a:dt:b;
    vt = exp(-0.1*t).*cos(5*t)+(t.^2-0.1.*(t.^4));
    n = length(t);
    m = (n -1)/ 2;
    fa = vt(1);
    fb = vt(n);
    area = (dt / 3) * (fa + fb);
    for i = 1:m
        area = area + (dt / 3) * 4 * vt(2*i) ;
    end
    for i = 2:m
        area = area + (dt / 3) * 2 * vt((2*i-1)) ;
    end
