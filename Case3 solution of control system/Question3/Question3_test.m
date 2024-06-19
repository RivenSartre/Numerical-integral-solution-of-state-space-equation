clear all

P=[ 1,0.01,1,0;
    0,0.085,1,0.17;
    1,0.01,1,0;
    0,0.051,1,0.15;
    1,0.0067,70,0;
    1,0.15,0.21,0;
    0,1,130,0;
    1,0.01,0.1,0;
    1,0.01,0.0044,0];

WIJ=[1,0,1;
    2,1,1;
    2,9,-1;
    3,2,1;
    4,3,1;
    4,8,-1;
    5,4,1;
    6,5,1;
    6,7,-0.212;
    7,6,1;
    8,6,1;
    9,7,1];

n=9;
Y0=1;
Yt0=[0,0,0,0,0,0,0,0,0];
h=0.001;
L1=1;
T0=0;
Tf=10;
nout=7;
S=[0,0,0,0,0,0,0,0,0];
Z=[0,0,0,0,0,0,0,0,0];

%  形成闭环各系数阵
A=diag(P(: ,1));B=diag(P(: ,2));
C=diag(P(: ,3));D=diag(P(: ,4));
m=length(WIJ(: ,1));
W0=zeros(n,1);W=zeros(n,n);
for k=1:m
    if (WIJ(k,2)==0);W0(WIJ(k,1))=WIJ(k,3);
    else W(WIJ(k,1),WIJ(k,2))=WIJ(k,3);
    end
end
Q=B-D*W;
Qn=inv(Q);
R=C*W-A;  V1=C*W0;
Ab=Qn*R;  b1=Qn*V1;

  


 
 %% sp3_3.m
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



 
 
 %% 3-4
Y=zeros(n,1);X=Y;y=0;Uk=zeros(n,1);Ubb=Uk;

t=T0:h*L1:Tf;N=length(t);
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
        X=FI'.*X+FIM'.*Uk+FIJ'.*Udot;
        Yb=Y;
        Y=FIC'.*X+FID'.*Uf;
        for i=1:n
            if(Z(i)~=0)
                if(Z(i)==4)
                    Y(i)=satu(Y(i),S(i));
                end
                if(Z(i)==5)
                    Y(i)=dead(Y(i),S(i));
                end
                if(Z(i)==6)
                    [Uk(i),Ubb(i)]=backlash(Ubb(i),Uk(i),Ub(i),S(i));
                end
            end
        end
    end
    y=[y,Y(nout)];
end

Y1=Yt0';
y1=Y1(nout);
t1=T0;
N=round((Tf-T0)/(h*L1));
plot(t1,y1)
for i=1:N
    for j=1:L1
    K1=Ab*Y1+b1*Y0;
    K2=Ab*(Y1+h*K1/2)+b1*Y0;
    K3=Ab*(Y1+h*K2/2)+b1*Y0;
    K4=Ab*(Y1+h*K3)+b1*Y0;
    Y1=Y1+h*(K1+2*K2+2*K3+K4)/6;    
    end
    y1=[y1,Y1(nout)];
    t1=[t1,t1(i)+h*L1];

end
plot(t,y)
% sim('sp3');
% xx=ID(:,1);
% yy=ID(:,2);
% [t1',y1']
% 
%  plot(t1,y1,t,y,xx,yy)
%  legend('四阶龙格库塔','离散','真值');
%  hold on