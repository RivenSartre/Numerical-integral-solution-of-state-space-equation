function [FI,FIM,FIJ,FIC,FID] = Dispersestate(A,B,C,D,n,h)

for i=1:n
    if  (A(i,i)==0 )
       FI(i)=1;
       FIM(i)=h*C(i,i)/B(i,i);
       FIJ(i)=h*h*C(i,i)/B(i,i)/2;
       FIC(i)=1;FID(i)=0;
       if (D(i,i) ~=0)
           FID(i)=D(i,i)/B(i,i);
       else 
       end
    else
        FI(i)=exp(-h*A(i,i)/B(i,i));
        FIM(i)=(1-FI(i))*C(i,i)/A(i,i);
        FIJ(i)=h*C(i,i)/A(i,i)-FIM(i)*B(i,i)/A(i,i);
        FIC(i)=1;FID(i)=0;
        if(D(i,i)~=0)
            FIM=(1-FI(i))*D(i,i)/A(i,i);
            FIJ(i)=h*D(i,i)/A(i,i)-FIM(i)*B(i,i)/A(i,i);
            FIC(i)=C(i,i)/D(i,i)-A(i,i)/B(i,i);
            FID(i)=D(i,i)/B(i,i);
        else 
        end
    end
end

end

