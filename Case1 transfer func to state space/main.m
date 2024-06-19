tic

%% ���� 
clear;
clc;

%% ΢�ַ�����ʽ
% a0*y^n+a1*y^{n-1}+...+a{n-1}*y'+an*y=c0*u^n+c1*u^{n-1}+...+c{n-1}*u'+cn*u

%% ��ʼ�� complate
%num_data=[1 3 2]; %num=[b_0,b_1,b_2,...,b_n]
%den_data=[1 7 12 0]; %den=[a_0,a_1,a_2,...,a_n]

num_data=[0 1.18182 0 0]; %num=[b_0,b_1,b_2,...,b_n]
den_data=[1 0.1818 -31.1818 -4.4541 0]; %den=[a_0,a_1,a_2,...,a_n]

Y=[1;1;1];
U_obs=[2;4];
U_2nd=[2;4;0];

%% ����һ����ִ�� complate

[num,den,m,n] = initialize( num_data,den_data ) %��ʼ��
[A,B,C,D] = controllable(num,den,n) %�ܿر�׼��
[Av,Bv,Cv,Dv] =observant(num,den,n) %�ܹ۱�׼��
[A_tf,B_tf,C_tf,D_tf] =fun_ft2ss(num,den,n) %ָ��ʵ��

%% ���������ִ�� complate

[num,den,m,n] = initialize( num_data,den_data ) %��ʼ��
[AT,CT,X] = original_obs(num,den,n,Y,U_obs ) %�ɹ۱�׼�ͳ�ֵ����
[AK,CK,V] = original_2nd(num,den,n,Y,U_2nd)%��һ����ʽ��ֵ����

toc