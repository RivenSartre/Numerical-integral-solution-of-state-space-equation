function [A,B,C,D] = controllable(num,den,n)
A=zeros(n-1);
B=zeros(n-1,1);
C=zeros(1,n-1);
D=num(n);

for i=1:n-1
    for j=1:n-1
       if i+1==j
           A(i,j)=1;
       end
    end
end

for i=1:n-1
    A(n-1,i)=-den(1,n-i+1);
end


B(n-1,1)=1;

for i=1:n-1
    C(i)=(num(n-i+1)-num(1)*den(n-i+1));
end

D=num(1);
end

