function [ yk ] = RungeKutta23( a,b,h,N,y0 )
    yk=zeros(N,1);
    yk(1)=y0;
    
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-1
        yk(k+1)=yk(k)+h/2*(funty(t(k),yk(k)) + funty2(t(k)+h, yk(k)+h*funty(t(k),yk(k))) );
    end
end