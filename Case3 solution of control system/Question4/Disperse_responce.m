function [y,Y] = Disperse_responce (X,W,W0,Y,y,Y0,Phi,Phi_m,Phi_j,Phi_c,Phi_d,Uk,N,h,nout,L1 )

for k=1:N-1
	for i=1:L1
		Ub=Uk;
		Uk=W*Y+W0*Y0;
		Udot=(Uk-Ub)/h;
		Uf=2*Uk-Ub;
		X=Phi'.*X+Phi_m'.*Uk+Phi_j'.*Udot ;
		Y=Phi_c'.*X+Phi_d'.*Uf;
    end
	y=[y,Y(nout)];
end	
end

