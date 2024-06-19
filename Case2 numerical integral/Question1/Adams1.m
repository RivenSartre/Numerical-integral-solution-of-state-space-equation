function [ yk ] = Adams1( a,b,h,N,y0 )
    yk=zeros(N,1);
    yk(1)=y0;
    t=h+a;
    yk(2)=yk(1)+h/4*(funty(t,yk(1))+3*funty(t+2/3*h, yk(1)+2/3*h*funty(t+h/3,yk(1)+h/3*funty(t,yk(1)))));
    
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-2
        yk(k+2)=yk(k+1)+h/2*(3*funty(t(k+1),yk(k+1))-funty(t(k),yk(k)));
    end 
    
end

