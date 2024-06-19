function [A_tf,B_tf,C_tf,D_tf] =fun_ft2ss(num,den,n)
A_tf0=zeros(n);
B_tf0=zeros(n,1);
C_tf0=zeros(1,n);
D_tf=num(1);

[A_tf0,B_tf0,C_tf0,D_tf0]=tf2ss(num,den);

A_tf=fliplr (flipud (A_tf0));
B_tf=flipud (B_tf0);
C_tf=fliplr (C_tf0);
end

