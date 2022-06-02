
clear all;

%第一问
t = 0:0.5:30;
mu1 = .1;
y0 = [0.1; -1];
ode1 = @(t,y)vdp(t,y,mu1);
[t1,y1] = ode45(ode1,t,y0);

mu2 = 1;
ode2 = @(t,y)vdp(t,y,mu2);
[t2,y2] = ode45(ode2,t,y0);

mu3 = 20;
ode3 = @(t,y)vdp(t,y,mu3);
[t3,y3] = ode45(ode3,t,y0);
figure(1);
subplot(1,3,1),plot(t1,y1(:,2));
xlabel('t');ylabel("y'");
subplot(1,3,2),plot(y1(:,1),y1(:,2));
xlabel('y');ylabel("y'");
subplot(1,3,3),plot3(t1,y1(:,1),y1(:,2));
xlabel('t');ylabel("y");zlabel("y'");
figure(2);
subplot(1,3,1),plot(t2,y2(:,2));
xlabel('t');ylabel("y'");
subplot(1,3,2),plot(y2(:,1),y2(:,2));
xlabel('y');ylabel("y'");
subplot(1,3,3),plot3(t2,y2(:,1),y2(:,2));
xlabel('t');ylabel("y");zlabel("y'");
figure(3);
subplot(1,3,1),plot(t3,y3(:,2));
xlabel('t');ylabel("y'");
subplot(1,3,2),plot(y3(:,1),y3(:,2));
xlabel('y');ylabel("y'");
subplot(1,3,3),plot3(t3,y3(:,1),y3(:,2));
xlabel('t');ylabel("y");zlabel("y'");
%利用myode45
myode1 = @(t,y)vdp(t,y,mu1);
y = [0.1;-1];
for i = 2:61
    y = [y myode45(myode1,0.5,t(i-1),y(:,i-1))];
end
y = y';
figure(4);
subplot(2,3,1),plot(t,y(:,2),'r');
xlabel('t');ylabel("y'");
subplot(2,3,2),plot(y(:,1),y(:,2),'r');
xlabel('y');ylabel("y'");
subplot(2,3,3),plot3(t,y(:,1),y(:,2),'r');
xlabel('t');ylabel("y");zlabel("y'");
subplot(2,3,4),plot(t1,y1(:,2));
xlabel('t');ylabel("y'");
subplot(2,3,5),plot(y1(:,1),y1(:,2));
xlabel('y');ylabel("y'");
subplot(2,3,6),plot3(t1,y1(:,1),y1(:,2));
xlabel('t');ylabel("y");zlabel("y'");