function [AT,CT,X] = original_obs(num,den,n,Y,U_obs )
AT=zeros(n-1);
CT=zeros(n-1,n-2);

X=zeros(n-1,1); %X=[x_1,x_2,x_3,...,x_{n-1},x_n]

for i=1:n-1
    for j=1:n-1
        
        if i+j<n
            AT(i,j)=den(n-i-j+1);
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
            CT(i,j)=num(n-i-j+1);
        end
        
        if i+j==n
            CT(i,j)=0;
        end 
        
        if i+j>n
            CT(i,j)=0;
        end
        
    end
end


X=AT*Y+CT*U_obs;
end

