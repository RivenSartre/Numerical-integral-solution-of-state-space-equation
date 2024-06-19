tic
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

%% 可观标准型的状态变量初值计算 complate

AT=zeros(n-1);
CT=zeros(n-1,n-2);

X=zeros(n-1,1); %X=[x_1,x_2,x_3,...,x_{n-1},x_n]
Y=zeros(n-1,1); %Y=[y,y',y'',...,y^{n-2},y^{n-1}]
U=zeros(n-2,1); %U=[u,u',u'',...,u^{n-3},u^{n-2}]

Y=[1;1;1];
U=[2;4];   %此情况U的列数为n-2

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

%% 第二种标准型的状态变量初值计算 complate

AK=zeros(n-1);
CK=zeros(n-1);

V=zeros(n-1,1); %X=[v_1,v_2,v_3,...,v_{n-1},v_n]

Y=[1;1;1];
U=[2;4;0];

for i=1:n-1
    for j=1:i
        
        AK(i,j)=den(i-j+1);
        
    end
end

for i=1:n-1
    for j=1:i
        
        CK(i,j)=-num(i-j+1);
        
    end
end

V=AK*Y+CK*U;

toc