function [ yk ] = Gear2( a,b,h,N )
    yk=zeros(N,1);
    yk(1)=0;
    yk(2)=0.905;
    yk(3)=0.819;
    
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-3
        yk(k+3)=1/2*( 0-3*yk(k+2) +6*yk(k+1)  -yk(k) +6*h*funty(t(k+2),yk(k+2))     );
    end 
end