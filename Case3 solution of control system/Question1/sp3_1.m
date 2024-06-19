clc
clear

den = [0.016 0.864 3.27 3.42 1];
num = [35 20];
X0=[0 0 0 0];
V=2;
n=4;
T0=0;
Tf=10.1;
h=0.1;
R=20;

num = num/den(1); den = den/den(1); A = den(2:n+1);
A=[rot90(rot90(eye(n-1,n)));-fliplr(A)];
B=[zeros(1,n-1),1]';
m1=length(num);
C=[fliplr(num),zeros(1,n-m1)];
Ab=A-B*C*V;
X=X0';y=0;t=T0;

N=round((Tf-T0)/h);
for i=1:N
	K1=Ab*X+B*R;
	K2=Ab*(X+h*K1/2)+B*R;
	K3=Ab*(X+h*K2/2)+B*R;
	K4=Ab*(X+h*K3)+B*R;
	X=X+h*(K1+2*K2+2*K3+K4)/6;
	y=[y,C*X];
	t=[t,t(i)+h];
end

[t',y']
plot(t,y)