clc
clear

%% 初始化：初参数确定
n=4;                                % 总环节个数
Y0=10;                              % 阶跃响应幅值
Yt0=[0 0 0 0];            % 各环节初值
h=0.001;                            % 计算步长
L1=1;                             % 输出步长
a=0;    b=10;                     % 响应上下限
nout=4;                             % 输出环节号
Y=Yt0';			

S=[5,0,0,0];
Z=[4,0,0,0];

Y=zeros(n,1);   X=Y;    y=0;    Uk=zeros(n,1);  Ubb=Uk;
t=a:h*L1:b;     N=length(t);
Uk=zeros(n,1);	Ub=Uk;

%% 初始化：构建连接矩阵
Wij=[1 4 -1
    1 0 1
    2 1 1
    3 2 1
    4 3 1];

[W,W0]=Connectmatrix(Wij,n)

%% 初始化：构建状态矩阵
P=[0.1 1 0.5 1
    0 1 20 0
    2 1 1 0
    10 1 1 0];

[A,B,Ab,b1,C,D,R,Q]=Statematrix(P,W,W0)

%% 计算离散化参数
Phi=zeros(n,1);
Phi_m=zeros(n,1);
Phi_j=zeros(n,1);
Phi_c=zeros(n,1);
Phi_d=zeros(n,1);

[Phi,Phi_m,Phi_j,Phi_c,Phi_d] = Dispersestate(A,B,C,D,n,h)

%% 计算离散化响应
load('step_5.mat')
load('satu.mat')
[y,Y]=Disperse_responce(X,W,W0,Y,y,Y0,Phi,Phi_m,Phi_j,Phi_c,Phi_d,Uk,N,h,nout,L1)
figure(1)
plot(t,y,'k-',t,step_5,'--');
legend('Disperse responce','Sreal');

deltaS =deltaY(step_5,y,N);
figure(2)
plot(t,deltaS,'k--');
legend('Disperse responce');

%% 计算非线性离散化响应
V=zeros(n,1);   X=V;    v=0;    Uk=zeros(n,1);  Ubb=Uk;
Uk=zeros(n,1);	Ub=Uk;

[y_satu,Y_backlash]=DisperseNonlinearity_responce(X,W,W0,V,v,Y0,Phi,Phi_m,Phi_j,Phi_c,Phi_d,Uk,N,h,Z,S,Ubb,n,nout,L1 )

figure(3)
plot(t,y_satu,'g-',t,y,'--',t,satu,'-');
legend('DisperseNonlinearity responce','Disperselinear responce','Sreal');

deltaS_s =deltaY(satu,y_satu,N);
figure(4)
plot(t,deltaS_s,'k--');
legend('DisperseNonlinearity responce');
