function [ yk ] = Euler( a,b,h,N,y0 )
    yk=zeros(N,1);
    yk(1)=y0;
    
    for k=1:N-1
    	t(k)=k*h+a;
        yk(k+1)=yk(k)+h*funty(t(k),yk(k));
    end
    
end

