
%第二问
clear all;

y0 = [0.1; -1];
t1 = 0:0.5:10;
mu1 = .1;
ode1 = @(t1,y)vdp(t1,y,mu1);
[t1,y1] = ode45(ode1,t1,y0);


t2 = 10.5:0.5:19.5;
mu2 = 1;
ode1 = @(t2,y)vdp(t2,y,mu2);
[t2,y2] = ode45(ode1,t2,y0);


t3 = 20:0.5:30;
mu3 = 20;
ode1 = @(t3,y)vdp(t3,y,mu3);
[t3,y3] = ode45(ode1,t3,y0);

y = [y1' y2' y3'];
t = [t1' t2' t3'];
y = y';
t = t';
subplot(1,3,1),plot(t,y(:,2));
xlabel('t');ylabel("y'");
subplot(1,3,2),plot(y(:,1),y(:,2));
xlabel('y');ylabel("y'");
subplot(1,3,3),plot3(t,y(:,1),y(:,2));
xlabel('t');ylabel("y");zlabel("y'");

