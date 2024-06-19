function [ yk ] = RungeKutta4( a,b,h,N,y0 )
    yk=zeros(N,1);
    yk(1)=y0;
    
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-1
        yk(k+1)=yk(k)+h/6*( funty(t(k), yk(k))   +2*funty(t(k)+h/2, yk(k)+h/2*funty(t(k), yk(k))) +2*funty(t(k)+h/2, yk(k)+h/2*funty(t(k)+h/2, yk(k)+h/2*funty(t(k), yk(k))))    +funty(t(k)+h, yk(k)+h*funty(t(k)+h/2, yk(k)+h/2*funty(t(k)+h/2, yk(k)+h/2*funty(t(k), yk(k))))  ) );
    end
end



