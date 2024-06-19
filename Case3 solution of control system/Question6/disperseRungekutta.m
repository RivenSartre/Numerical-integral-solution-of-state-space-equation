function [outputArg1,outputArg2] = disperseRungekutta (inputArg1,inputArg2)
for i=1:n
	if(A(i)==0)
		Phi(i)=1;
		Phi_m(i)=h*C(i)/B(i);
		Phi_j(i)=h*h*C(i)/B(i)/2;
		Phi_c(i)=1;	
        Phi_d(i)=0;
		if(D(i)~=0)
			Phi_d(i)=D(i)/B(i);
		else
		end
	else
		Phi(i)=exp(-h*A(i)/B(i));
		Phi_m(i)=(1-Phi(i))*C(i)/A(i);
		Phi_j(i)=h*C(i)/A(i);
		Phi_c(i)=1;	
        Phi_d(i)=0;
		if(D(i)~=0)
			Phi_m=(1-Phi(i))*D(i)/A(i);
			Phi_j(i)=h*D(i)/A(i)-Phi_m(i)*B(i)/A(i);
			Phi_c(i)=C(i)/D(i)-A(i)/B(i);
			Phi_d(i)=D(i)/B(i);
		else
		end
	end
end	

Y=zeros(n,1);	X=Y;	y=0;	Uk=zeros(n,1);	Ub=Uk;
t=a:h*L1:b;	N=length(t);
for k=1:N-1
	for i=1:L1
		Ub=Uk;
		Uk=W*Y+W0*Y0;
		Udot=(Uk-Ub)/h;
		Uf=2*Uk-Ub;

		X=Phi'.*X+Phi_m'.*Uk+Phi_j'.*Udot;
		Y=Phi_c'.*X+Phi_d'.*Uf;
	end
	
	y=[y,Y(nout)];
end	
end

