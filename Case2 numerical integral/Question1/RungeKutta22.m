function [ yk ] = RungeKutta22( a,b,h,N,y0 )
    yk=zeros(N,1);
    yk(1)=y0;
    
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-1
        yk(k+1)=yk(k)+h/4*(funty(t(k),yk(k))+3*funty2(t(k)+3/2*h, yk(k)+2/3*h*funty(t(k),yk(k) )  ) );
    end
end