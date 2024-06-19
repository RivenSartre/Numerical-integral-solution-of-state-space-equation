clear
clc

%% 初始化：闭环传递函数
t=15;h=0.09;
num_data = [0 0 0 30 25];
den_data = [0.016 0.864 3.27 3.42 1];

den_data = den_data + 2*num_data; %运算闭环传递函数
 Tsys1 = tf(num_data,den_data)   %代码输出


%% 初始化：能控标准型实现
[num_h,den_h,m,n] = initialize( num_data,den_data ) %初始化
[A,B,C,D] = controllable(num_h,den_h,n)             %能控标准型
x0 = [0 0 0 0]';        %第一初值
i=0:h:t+h;
N=(t+h)/h+1;

%% 计算阶跃响应与响应曲线
load('step_1.mat')
u=20*ones(1,N);
S4 = RungeKutta4_solve(A,B,C,D,x0,u,h,t);

figure(1)
plot(i,S4,'g-');
legend('RungeKutta4');

