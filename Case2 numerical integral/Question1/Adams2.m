function [ yk ] = Adams2( a,b,h,N,Y )
    yk=zeros(N,1);
    yk(1)=1;
    for k=1:N
        t(k)=k*h+a;
    end
    
    for k=1:N-1
        yk(k+1)=yk(k)+h*funty(t(k+1),Y(k+1)); 
        
        
        while 1
        Y(k+1)=yk(k+1);
        yk(k+1)=yk(k)+h*funty(t(k+1),Y(k+1));
        
            if abs(Y(k+1)-yk(k+1)) <=0.005 
            	break
            end
        end 
        
        
        
        
    end
end

