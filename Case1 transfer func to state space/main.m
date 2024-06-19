tic

%% 清屏 
clear;
clc;

%% 微分方程形式
% a0*y^n+a1*y^{n-1}+...+a{n-1}*y'+an*y=c0*u^n+c1*u^{n-1}+...+c{n-1}*u'+cn*u

%% 初始化 complate
%num_data=[1 3 2]; %num=[b_0,b_1,b_2,...,b_n]
%den_data=[1 7 12 0]; %den=[a_0,a_1,a_2,...,a_n]

num_data=[0 1.18182 0 0]; %num=[b_0,b_1,b_2,...,b_n]
den_data=[1 0.1818 -31.1818 -4.4541 0]; %den=[a_0,a_1,a_2,...,a_n]

Y=[1;1;1];
U_obs=[2;4];
U_2nd=[2;4;0];

%% 问题一程序执行 complate

[num,den,m,n] = initialize( num_data,den_data ) %初始化
[A,B,C,D] = controllable(num,den,n) %能控标准型
[Av,Bv,Cv,Dv] =observant(num,den,n) %能观标准型
[A_tf,B_tf,C_tf,D_tf] =fun_ft2ss(num,den,n) %指令实现

%% 问题二程序执行 complate

[num,den,m,n] = initialize( num_data,den_data ) %初始化
[AT,CT,X] = original_obs(num,den,n,Y,U_obs ) %可观标准型初值计算
[AK,CK,V] = original_2nd(num,den,n,Y,U_2nd)%另一种形式初值计算

toc