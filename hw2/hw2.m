clear all;


%Q1 求积分
a = 0;
b = 4;
dt = 0.01;
t = a:dt:b;%时间区间
vt = exp(-0.1*t).*cos(5*t)+(t.^2-0.1.*(t.^4));%速度方程

n = length(t);%分了多少区间

% left-rectangle rule
area0 = 0;
for i = 1:n-1
    area0 = area0 + vt(i) * dt;
end

% right-rectangle rule
area1 = 0;
for i = 2:n
    area1 = area1 + vt(i) * dt;
end

% trapezoid rule
area2 = 0;
for i = 1:n-1
    area2 = area2 + (vt(i) + vt(i+1)) * (dt / 2); 
end

%Simpson’s rule
area3 = 0;
area3 = simpson();%area4是自己编写的公式
area4 = 0;
vt1 = @(t)exp(-0.1*t).*cos(5*t)+(t.^2-0.1.*(t.^4));
area4 = integral(vt1,0,4);%area5是自带的积分

%Q2 center differencing

for i = 1:n
    if i == 1 %第一个点只能前向
        at =(vt(i+1) - vt(i)) / dt ;
    elseif i > 1 && i < n
        at = [at (vt(i+1) - vt(i-1)) / (2*dt)];
    elseif i == n
        at = [at (vt(i) - vt(i-1)) / dt];
    end
end
figure(1);
plot(t, vt, 'b', 'linewidth', 1.2);
hold on;
plot(t, at, 'g', 'linewidth', 1.2);
l2 = legend('at','vt');
set(l2, 'fontsize', 14);
xlabel("t");
ylabel("a(t)或v(t)");

%Q3 计算jerk

dvt = -0.1.*exp(-0.1*t).*cos(5*t) - 5.*exp(-0.1*t).*sin(5*t) + (2.*t-(0.3).*(t.^3));
ddvt = 0.01.*exp(-0.1*t).*cos(5*t)+exp(-0.1*t).*sin(5*t)- 25.*exp(-0.1*t).*cos(5*t)+ (2-(0.9).*(t.^2));
jerk = (dvt(2)-dvt(1)) / (dt);

for i = 2:n-1
    jerk = [jerk (vt(i+1)+vt(i-1)-2*vt(i))/(dt^2)];
end
jerk =[jerk (dvt(n)-dvt(n-1)) / (dt)] ;
figure(2);
plot(t,jerk,'b', 'linewidth', 1.2);
hold on;
plot(t,ddvt,'r', 'linewidth', 1.2);
xlabel("t");
ylabel("jerk(t)");
l2 = legend('推导','二阶导');