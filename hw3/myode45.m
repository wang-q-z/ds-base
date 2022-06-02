function yn_1 = myode45(fun, dt, tn, yn)
    f1 = fun(tn, yn);
    f2 = fun(tn+dt/2, yn+(dt/2)*f1);
    f3 = fun(tn+dt/2, yn+(dt/2)*f2);
    f4 = fun(tn+dt, yn+dt*f3);
    yn_1 = yn + (dt/6) * (f1 + 2*f2 + 2*f3 + f4);


