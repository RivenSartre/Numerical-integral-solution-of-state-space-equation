function [Y] = RungeKutta4_solve(A,B,C,D,x,u,h,t)
   i = 1;
   yk =C * x + D * u(i);
   n=length(0:h:t);
   Y=zeros(n,1);
   Y(i,1) = yk;
   for j=0:h:t
       k1 = h * funab(A,B,x,u,i);
       k2 = h * funab(A,B,x+k1 /2,u,i);
       k3 = h * funab(A,B,x+k2 /2,u,i);
       k4 = h * funab(A,B,x+k3,u,i);
       xk = x + (1/6)*(k1 + 2*k2 +2*k3 +k4);
       yk = C * xk + D * u(i);
       i = i + 1;
       Y(i,1) = yk;
       x = xk;
   end
end