function [AK,CK,V] = original_2nd(num,den,n,Y,U_2nd)
AK=zeros(n-1);
CK=zeros(n-1);

V=zeros(n-1,1); %X=[v_1,v_2,v_3,...,v_{n-1},v_n]

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

V=AK*Y+CK*U_2nd;
end

