function [ yk ] = Gear( a,b,h,N,y )
    yk=zeros(N,1);
    yk(1)=y;
    t=h+a;
    yk(2)=yk(1)+h/4*(funty(t,yk(1))+3*funty(t+2/3*h, yk(1)+2/3*h*funty(t+h/3,yk(1)+h/3*funty(t,yk(1)))));   
    t=t+h;
    yk(3)=yk(2)+h/4*(funty(t,yk(2))+3*funty(t+2/3*h, yk(2)+2/3*h*funty(t+h/3,yk(2)+h/3*funty(t,yk(2)))));   

    T(1)=a;
    T(2)=a+h;
    T(3)=a+2*h;

    for k=1:N-3
        t=(k+1)*h+a;
        yk(k+3)=1/2*(-3*y+6*h*funty(T(k+2),yk(k+2))+6*yk(k+1)-yk(k));
        T(k+3)=t+h;
        
        y=1/11*(18*yk(k+2)-9*yk(k+1)+2*yk(k)+6*h*funty(T(k+3),yk(k+3)));
        yk(k+3)=y;
        T(k+3)=t+h;
        
        while 1
            
            if abs(yk(k+3)-y)<=0.005
                break
            end
            
        end
        
        
    end
end

