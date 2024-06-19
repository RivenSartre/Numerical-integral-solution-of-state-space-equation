function [Av,Bv,Cv,Dv] =observant(num,den,n)
Av=zeros(n-1);
Bv=zeros(n-1,1);
Cv=zeros(1,n-1);
Dv=num(n);

for i=1:n-1
    for j=1:n-1
       if i+1==j
           Av(j,i)=1;
       end
    end
end

for i=1:n-1
    Av(i,n-1)=-den(1,n-i+1);
end


Cv(1,n-1)=1;

for i=1:n-1
    Bv(i,1)=(num(n-i+1)-num(1)*den(n-i+1));
end

Dv=num(1);
end

