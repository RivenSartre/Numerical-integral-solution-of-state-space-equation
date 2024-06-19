function [yk]=Adams(a,b,h,N,y)    
    yk=zeros(N,1);
    yk(1)=y;
    t=h+a;
    yk(2)=yk(1)+h/4*(funty(t,yk(1))+3*funty(t+2/3*h, yk(1)+2/3*h*funty(t+h/3,yk(1)+h/3*funty(t,yk(1)))));    

    T(1)=a;
    T(2)=a+h;
    
    for k=1:N-2
        t=k*h+a;
        y=y+h/2*(3*funty(T(k+1),yk(k+1))-funty(T(k),yk(k)));
        yk(k+2)=y;
        T(k+2)=t+h;
        
        y=yk(k+1)+h*funty(T(k+2),yk(k+2));
        yk(k+2)=y;
    end
    
end