clear
clc

%% 初始化：闭环能控标准型实现
t=10;h=0.01;
v=2;
num_data = [0 0 0 30 25];
den_data = [0.016 0.864 3.27 3.42 1];

den_data=v*num_data+den_data;
[num_h,den_h,m,n] = initialize( num_data,den_data ) %初始化
[A,B,C,D] = controllable(num_h,den_h,n)             %能控标准型
% A=A-B*C*v;

x0 = [0 0 0 0]';        %第一初值
i=0:h:t+h;
N=round((t+h)/h+1);

%% 计算阶跃响应
load('step_1.mat')
u = 20*ones(1,N);
S = RungeKutta4_solve(A,B,C,D,x0,u,h,t);
deltaS =deltaY(step_1,S,N);

%% 响应曲线与响应误差曲线
figure(1)
plot(i,S,'g-',i,step_1,'--');
legend('RungeKutta4','Sreal');
grid on

figure(2)
plot(i,deltaS,'k-');
legend('RungeKutta4');
grid on
