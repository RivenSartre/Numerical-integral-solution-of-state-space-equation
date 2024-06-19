clear
clc

%% ��ʼ�����ջ����ݺ���
t=15;h=0.09;
num_data = [0 0 0 30 25];
den_data = [0.016 0.864 3.27 3.42 1];

den_data = den_data + 2*num_data; %����ջ����ݺ���
 Tsys1 = tf(num_data,den_data)   %�������


%% ��ʼ�����ܿر�׼��ʵ��
[num_h,den_h,m,n] = initialize( num_data,den_data ) %��ʼ��
[A,B,C,D] = controllable(num_h,den_h,n)             %�ܿر�׼��
x0 = [0 0 0 0]';        %��һ��ֵ
i=0:h:t+h;
N=(t+h)/h+1;

%% �����Ծ��Ӧ����Ӧ����
load('step_1.mat')
u=20*ones(1,N);
S4 = RungeKutta4_solve(A,B,C,D,x0,u,h,t);

figure(1)
plot(i,S4,'g-');
legend('RungeKutta4');

