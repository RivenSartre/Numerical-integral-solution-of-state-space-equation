function [y,Y] = DisperseNonlinearity_responce( X,W,W0,Y,y,Y0,Phi,Phi_m,Phi_j,Phi_c,Phi_d,Uk,N,h,Z,S,Ubb,n,nout,L1 )
for k=1:N-1
    for l=1:L1
        Ub=Uk;
        Uk=W*Y+W0*Y0;
        for i=1:n
            if(Z(i)~=0)
               if(Z(i)==1)
                   Uk(i)=satu(Uk(i),S(i));
               end
               if(Z(i)==2)
                   Uk(i)=dead(Uk(i),S(i));
               end
               if(Z(i)==3)
                   [Uk(i),Ubb(i)]=backlash(Ubb(i),Uk(i),Ub(i),S(i));
               end
            end
        end
        Udot=(Uk-Ub)/h;
        Uf=2*Uk-Ub;
        X=Phi'.*X+Phi_m'.*Uk+Phi_j'.*Udot;
        Yb=Y;
        Y=Phi_c'.*X+Phi_d'.*Uf;
        for i=1:n
            if(Z(i)~=0)
                if(Z(i)==4)
                    Y(i)=satu(Y(i),S(i));
                end
                if(Z(i)==5)
                    Y(i)=dead(Y(i),S(i));
                end
                if(Z(i)==6)
                    [Y(i),Ubb(i)]=backlash(Ubb(i),Y(i),Yb(i),S(i));
                end
            end
        end
    end
    y=[y,Y(nout)];
end
end

