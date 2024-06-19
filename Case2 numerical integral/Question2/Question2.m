clear
clc

%% 初始化：闭环传递函数
t=15;h=0.001;
num_data = [0 0 0 5 100];
den_data = [1 8 31.99 75.21 0];

den_data = den_data + num_data; %运算闭环传递函数
% Tsys1 = tf(num_data,den_data)   %代码输出

%% 求解零极点
% sym s
% eq1='5*s + 100 = 0';
% eq2='s^4 + 8*s^3 + 31.99*s^2 + 80.21*s + 100 = 0';
% z = solve(eq1)
% p = solve(eq2)

%% 初始化：能控标准型实现
[num_h,den_h,m,n] = initialize( num_data,den_data ) %初始化
[A,B,C,D] = controllable(num_h,den_h,n)             %能控标准型
x0 = [0 0 0 0]';        %第一初值
i=0:h:t+h;
N=(t+h)/h+1;

%% 计算阶跃响应
load('S_real1000.mat')
load('R_real1000.mat')
u=ones(1,N);
S1 = Euler_solve(A,B,C,D,x0,u,h,t);
S2 = RungeKutta2_solve(A,B,C,D,x0,u,h,t);
S3 = RungeKutta3_solve(A,B,C,D,x0,u,h,t);
S4 = RungeKutta4_solve(A,B,C,D,x0,u,h,t);

S = [S1(N) S2(N) S3(N) S4(N)]

%% 计算斜坡响应
for j=1:N
    v(j)=i(j);
end
R1 = Euler_solve(A,B,C,D,x0,v,h,t);
R2 = RungeKutta2_solve(A,B,C,D,x0,v,h,t);
R3 = RungeKutta3_solve(A,B,C,D,x0,v,h,t);
R4 = RungeKutta4_solve(A,B,C,D,x0,v,h,t);

R = [R1(N) R2(N) R3(N) R4(N)]

%% 响应曲线

figure(1)
plot(i,S1,i,S2,'r-',i,S3,'c-',i,S4,'g-',i,S_real,'k--');
legend('Euler','RungeKutta2','RungeKutta3','RungeKutta4','Sreal');
figure(2)
plot(i,R1,i,R2,'r-',i,R3,'c-',i,R4,'g-',i,R_real,'k--');
legend('Euler','RungeKutta2','RungeKutta3','RungeKutta4','Rreal');

%% 响应误差曲线
deltaS1=deltaY(S_real,S1,N);
deltaS2=deltaY(S_real,S2,N);
deltaS3=deltaY(S_real,S3,N);
deltaS4=deltaY(S_real,S4,N);

deltaS = [deltaS1(N) deltaS2(N) deltaS3(N) deltaS4(N)]

deltaR1=deltaY(R_real,R1,N);
deltaR2=deltaY(R_real,R2,N);
deltaR3=deltaY(R_real,R3,N);
deltaR4=deltaY(R_real,R4,N);

deltaR = [deltaR1(N) deltaR2(N) deltaR3(N) deltaR4(N)]

figure(3)
plot(i,deltaS1,i,deltaS2,'r-',i,deltaS3,'c-',i,deltaS4,'k--');
legend('Euler','RungeKutta2','RungeKutta3','RungeKutta4');
figure(4)
plot(i,deltaR1,i,deltaR2,'r-',i,deltaR3,'c-',i,deltaR4,'k--');
legend('Euler','RungeKutta2','RungeKutta3','RungeKutta4');
