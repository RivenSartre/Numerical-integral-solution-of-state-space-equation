function [y,t] = Rungekutta (A,B,Y,Y0,h,nout,L1,N,y,t)
    for	i=1:N
        for j=1:L1

        	K1=A*Y+B*Y0;
            K2=A*(Y+h*K1/2)+B*Y0; 
            K3=A*(Y+h*K2/2)+B*Y0;
            K4=A*(Y+h*K3)+B*Y0;
            Y=Y+h*(K1+2*K2+2*K3+K4)/6;
	
        end
        y=[y,Y(nout)];
        t=[t,t(i)+h+L1];
    end
end

