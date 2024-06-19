P=[1 10 5 10
    1 0.5 1 0
    1 0.1 1 0
    0 1 1 0];

WIJ=[1 4 -1
    1 0 1
    2 1 1
    3 2 1
    4 3 1];

n=4;
Y0=10;
X0=[0 0 0 0];
Z=[0 0 0 6];
S=[0 0 0 1]
h=0.01;
L1=25;
T0=0;
Tf=10.1;
nout=4;
    
A=diag(P(:,1));B=diag(P(:,2));
C=diag(P(:,3));D=diag(P(:,4));
m=length(WIJ(:,1));
W0=zeros(n,1);W=zeros(n,n);
for k=1:m
	if (WIJ(k,2)==0)
		W0(WIJ(k,1))=WIJ(k,3);
	else
		W(WIJ(k,1),WIJ(k,2))=WIJ(k,3);
    end
end
Q=B-D*W;	Qn=inv(Q);
R=C*W-A;	V1=C*W0;
Ab=Qn*R;	b1=Qn*V1;

Y=X0';		y=Y(nout);	t=T0;
N=round((Tf-T0)/(h*L1));





Y=zeros(n,l); X=Y; y=0; Uk=zeros(n,l); Ubb=Uk;

t=T0:h*L1:Tf;N=length(t);
for k=1:N-1
	for l=l:Ll
		Ub=Uk;
		
		Uk=W*Y+W0*Y0;
		for i=l:n
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
		X=FI'.*X+FIM'.*Uk+FIJ'.*Udot;
		Yb=Y;
		Y=FIC'.*X+FID'.*Uf;
		
		for i=l:n
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