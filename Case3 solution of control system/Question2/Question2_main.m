clc
clear

%% 初始化：初参数确定
n=9;                                % 总环节个数
Y0=1;                              % 阶跃响应幅值
Yt0=[0 0 0 0 0 0 0 0 0];            % 各环节初值
h=0.001;                            % 计算步长
L1=1;                             % 输出步长
a=0;    b=5;                     % 响应上下限
nout=7;                             % 输出环节号
Y=Yt0';		y=Y(nout);	t=a;
N=round((b-a)/(h*L1));

%% 初始化：构建连接矩阵
Wij=[1,0,1
    2,1,1
    2,9,-1
    3,2,1
    4,3,1
    4,8,-1
    5,4,1
    6,5,1
    6,7,-0.212
    7,6,1
    8,6,1
    9,7,1 ];

[W,W0]=Connectmatrix(Wij,n)

%% 初始化：构建状态矩阵
P=[1 0.01 1 0
    0 0.085 1 0.17
    1 0.01 1 0
    0 0.051 1 0.15
    1 0.0067 70 0
    1 0.15 0.21 0
    0 1 130 0
    1 0.01 0.1 0
    1 0.01 0.0044 0];

[A,B,C,D,R,Q]=Statematrix(P,W,W0)

%% 计算响应曲线
load('step_2.mat')
[y,t] = Rungekutta (A,B,Y,Y0,h,nout,L1,N,y,t);
[t',y']
figure(1)
plot(t,y,'g-',t,step_2,'--');
legend('RungeKutta4','Sreal');
grid on

%% 计算响应误差
deltaS =deltaY(step_2,y,N+1);
figure(2)
plot(t,deltaS,'k-');
legend('RungeKutta4');
grid on

