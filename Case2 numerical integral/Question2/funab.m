function [ f ] = funab(A,B,x,u,i)
   f = A*x +  B*u(i);
end