%% 清屏 
clear;
clc;

%% 微分方程形式
% a0*y^n+a1*y^{n-1}+...+a{n-1}*y'+an*y=c0*u^n+c1*u^{n-1}+...+c{n-1}*u'+cn*u

%% 初始化 complate
num_data=[1 3 2]; %num=[b_0,b_1,b_2,...,b_n]
den_data=[1 7 12 0]; %den=[a_0,a_1,a_2,...,a_n]

m=length(num_data);
n=length(den_data);

if m>n
   disp('nonono!')
   return
end

a0=den_data(1);
num=num_data./a0;
den=den_data./a0;

s=n-m;
num=[zeros(1:s),num];

%% 能控标准型 complate

A=zeros(n-1);
B=zeros(n-1,1);
C=zeros(1,n-1);
D=num(n);

i=1;
j=1;

for i=1:n-1
    for j=1:n-1
       if i+1==j
           A(i,j)=1;
       end
    end
end

for i=1:n-1
    A(n-1,i)=-den(1,n-i+1)
end


B(n-1,1)=1;

for i=1:n-1
    C(i)=(num(n-i+1)-num(1)*den(n-i+1))
end

D=num(1);

%% 能观标准型 complate

Av=A';
Bv=C';
Cv=B';
Dv=D;

%% 指令实现 complate

A_tf0=zeros(n);
B_tf0=zeros(n,1);
C_tf0=zeros(1,n);
D_tf=num(n);

[A_tf0,B_tf0,C_tf0,D_tf0]=tf2ss(num,den);

A_tf=fliplr (flipud (A_tf0));
B_tf=flipud (B_tf0);
C_tf=fliplr (C_tf0);