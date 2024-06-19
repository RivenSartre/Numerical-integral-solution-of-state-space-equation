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
Y=Yt0';		y=Y(nout);	

S=[0,0,0,0,0,0,0,0,0];
Z=[0,0,0,0,0,0,0,0,0];

X=Y;	Uk=zeros(n,1);	Ub=Uk;
t=a:h*L1:b;	N=length(t);
y=0;

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

[A,B,Ab,b1,C,D,R,Q]=Statematrix(P,W,W0)

%% 计算离散化参数
Phi=zeros(n,1);
Phi_m=zeros(n,1);
Phi_j=zeros(n,1);
Phi_c=zeros(n,1);
Phi_d=zeros(n,1);

[Phi,Phi_m,Phi_j,Phi_c,Phi_d] = Dispersestate(A,B,C,D,n,h)

%% 计算离散化响应
load('step_3.mat')
[y,Y] = Disperse_responce ( X,W,W0,Y,y,Y0,Phi,Phi_m,Phi_j,Phi_c,Phi_d,Uk,N,h,nout,L1 );
figure(1)
plot(t,y,'g-',t,step_3,'--');
legend('Disperse responce','Sreal');
grid on

%% 计算响应误差
deltaS =deltaY(step_3,y,N);
figure(2)
plot(t,deltaS,'k-');
legend('Disperse responce');
grid on