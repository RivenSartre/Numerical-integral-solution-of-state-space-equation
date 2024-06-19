function [Y] = RungeKutta3_solve(A,B,C,D,x,u,h,t)
   i = 1;                   %循环1：输入
   yk =C * x + D * u(i);    
   n=length(0:h:t);         %定义响应矩阵
   Y=zeros(n,1);
   Y(i,1) = yk;
   for j=0:h:t
       k1 = h * funab(A,B,x,u,i) ;
       k2 = h * funab(A,B,x+k1 /3,u,i);
       k3 = h * funab(A,B,x+2*k2 /3,u,i);
       xk = x + (1/4)*(k1 + 3*k3 );
       yk = C * xk + D * u(i);
       i = i + 1;
       Y(i,1) = yk;
       x = xk;     
   end
end