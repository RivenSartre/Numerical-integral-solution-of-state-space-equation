%% 清屏 
clear;
clc;

%% 初始化
num_data=[1 3 2]; %num=[b_0,b_1,b_2,...,b_n]
den_data=[2 3 4 5 6 7 8]; %den=[a_0,a_1,a_2,...,a_n]

y0=[];
u0=[];

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
num=[num,zeros(1:s)];

%% 可控标准型的状态变量初值计算

AT=zeros(n-1);
CT=zeros(n-1,n-2);

X=zeros(n-1,1); %X=[x_1,x_2,x_3,...,x_{n-1},x_n]
Y=zeros(n-1,1); %Y=[y,y',y'',...,y^{n-2},y^{n-1}]
U=zeros(n-2,1); %U=[u,u',u'',...,u^{n-3},u^{n-2}]

Y=[1;1;1;1;1;1];
U=[1;2;2;2;2];

for i=1:n-1
    for j=1:n-1
        
        if i+j<n
            AT(i,j)=den(n-i-j+1)
        end
        
        if i+j==n
            AT(i,j)=1;
        end 
        
        if i+j>n
            AT(i,j)=0;
        end
        
    end
end

for i=1:n-1
    for j=1:n-2
        
        if i+j<n
            CT(i,j)=num(n-i-j+1)
        end
        
        if i+j==n
            CT(i,j)=0;
        end 
        
        if i+j>n
            CT(i,j)=0;
        end
        
    end
end


X=AT*Y+CT*U;

%% 计算状态空间矩阵

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
    A(i,1)=-den(i+1);
end

for i=1:n-1
    B(i,1)=num(i+1)-num(1)*den(i+1);
end

C(1)=1;

D=num(1);

%% 计算初值

x0=zeros(1,n);

for i=1:n
    x(i)=y0(i)-num(n)*u0(i)
end

x(1)=y0(1)-num(n)*u0(1);
x(2)=y0(2)-num(n)*u0(2) + 0

%% 一点点猜想

Y=[]; %[y(0),y'(0),y''(0),...,y^(n)(0)]
U=[]; %[u(0),u'(0),u''(0),...,u^(n)(0)]

A;
B;
C;
D;

Ck=zeros(n-1);
for i=1:n-1
    Ck(i,:)=C;
end

X=zeros(1:n-1);

X=(Y-D.*u'-Ck*B.*u)*inv(Ck*A);
了，