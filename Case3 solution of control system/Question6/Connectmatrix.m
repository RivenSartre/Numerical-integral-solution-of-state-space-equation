function [W,W0] = Connectmatrix( WIJ,n )
    m=length(WIJ(:,1));
    W0=zeros(n,1);W=zeros(n,n);
    for k=1:m
        if (WIJ(k,2)==0)
            W0(WIJ(k,1))=WIJ(k,3);
        else
            W(WIJ(k,1),WIJ(k,2))=WIJ(k,3);
        end
    end

end

