clear
clc

%% 初始化
a=0;            %积分下限
b=1;            %积分上限
h=0.001;          %步长
N=(b-a)/h+1;    %取点
y0=1;           %第一初值

%% 数值积分实现
Y1 = Euler(a,b,h,N,y0);
Y21 = RungeKutta21(a,b,h,N,y0);
Y22 = RungeKutta22(a,b,h,N,y0);
Y23 = RungeKutta23(a,b,h,N,y0);
Y3 = RungeKutta3(a,b,h,N,y0);
Y4 = RungeKutta4(a,b,h,N,y0);
Y5 = Adams1(a,b,h,N,y0);
Y6 = Adams2(a,b,h,N,Y4);
Y7 = Adams(a,b,h,N,y0);
Y8 = Gear(a,b,h,N,y0);

Ans=[Y1(N) Y21(N) Y22(N) Y23(N) Y3(N) Y4(N) Y5(N) Y7(N) Y8(N)];

%% 快速验证
for k=1:1:N             %真值计算
    x=(k-1)*h;
    y0(k)=exp(-x);
end

deltaY1 = deltaY(y0,Y1,N);
deltaY21 = deltaY(y0,Y21,N);
deltaY22 = deltaY(y0,Y22,N);
deltaY23 = deltaY(y0,Y23,N);
deltaY3 = deltaY(y0,Y3,N);
deltaY4 = deltaY(y0,Y4,N);
deltaY5 = deltaY(y0,Y5,N);
deltaY6 = deltaY(y0,Y6,N);
deltaY7 = deltaY(y0,Y7,N);
deltaY8 = deltaY(y0,Y8,N);

%% 运行绘图
x=a:h:b;
y=exp(-x);
figure     
plot(x,y,'--o',x,Y1,'c',x,Y21,'r',x,Y22,'r',x,Y23,'r',x,Y3,'y',x,Y4,'m',x,Y5,'g',x,Y6,'g',x,Y7,'b',x,Y8)
legend('Real','Euler','RungeKutta21','RungeKutta22','RungeKutta23','RungeKutta3','RungeKutta4','Adams1','Admas2','Admas','Gear');
% figure(2)
% plot(x,0,'-',x,deltaY1,'c--o',x,deltaY21,'r--o',x,deltaY22,'r--o',x,deltaY23,'r--o',x,deltaY3,'y--o',x,deltaY4,'m--o',x,deltaY5,'m--o',x,deltaY6,'g--o',x,deltaY7,'b--o',x,deltaY8,'--o')
% legend('Real','Euler','RungeKutta21','RungeKutta22','RungeKutta23','RungeKutta3','RungeKutta4','Adams1','Admas2','Admas','Gear');

figure(2)
subplot(2,2,1)
plot(x,y,'--o',x,Y1,'k-x')
legend('Real','Euler');
subplot(2,2,2)
plot(x,y,'--o',x,Y23,'r-x')
legend('Real','RungeKutta2');
subplot(2,2,3)
plot(x,y,'--o',x,Y3,'b-x')
legend('Real','RungeKutta3');
subplot(2,2,4)
plot(x,y,'--o',x,Y4,'m-x')
legend('Real','RungeKutta4');

figure(3)
subplot(2,2,1)
plot(x,y,'--o',x,Y5,'k-x')
legend('Real','Adams1');
subplot(2,2,2)
plot(x,y,'--o',x,Y6,'r-x')
legend('Real','Admas2');
subplot(2,2,3)
plot(x,y,'--',x,Y7,'b-x')
legend('Real','Adams');
subplot(2,2,4)
plot(x,y,'--',x,Y8,'m-')
legend('Real','Gear');