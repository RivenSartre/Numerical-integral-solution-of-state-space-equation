function [A,B,Ab,b1,C,D,R,Q] = Statematrix( P,W,W0 )
    A=diag(P(:,1));B=diag(P(:,2));
    C=diag(P(:,3));D=diag(P(:,4));

    Q=B-D*W;	Qn=inv(Q);
    R=C*W-A;	V1=C*W0;
    Ab=Qn*R;	b1=Qn*V1;
    
end

