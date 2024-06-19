function [num,den,m,n] = initialize( num_data,den_data )
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
end

