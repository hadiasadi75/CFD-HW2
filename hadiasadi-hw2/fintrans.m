clc
clear 
close all

Bi = 0.1;
Ar = 20;
mu = (Bi*Ar)^2;
dt=2/10000;
n = 5;

nReng=[1,2,4,8,12].*(n-1)+1;
z1=linspace(0.0,1.0,nReng(1));

m = 0;
dx = 0.02 ;
ddt = 0.00001 ;
x = 0 : dx : 1 ;
t = 0 : ddt : 1 ;
sol = pdepe(m,@pdepedx1,@pdepeic,@pdepebc,x,t);

for i=1:numel(nReng)
   n=nReng(i);
dz=1/(n-1);
 
 nu=dt/(dz)^2;
bex=zeros(n,1);
bex(1,1)=1;
bim=bex;
bct=bex;
bcn1=bex;
bcnt=bex;
[z,Aex,Aim,Act,Acn1,Acn2]=generit_lse(n,mu,Bi,dz,nu,dt);
bct(:,2)=Aex*bex;
bct1=bct(:,1);
bct2=bct(:,2);
for j=1:70
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bex=Aex*bex;
bim=Aim\bim;
bct=bct1+Act*bct2;
bct1=bct2;
bct1(1,1)=1;
bct2=bct;
bct2(1,1)=1;
bct(1,1)=1;
bcn1=Acn1*bcn1;
bcnt=Acn2\bcn1;

end
for j=1:numel(z1)-1
index(i,j)=floor(z1(j+1)/dz)+1;
i1(i,j)=bex(index(i,j));
i2(i,j)=bim(index(i,j));
i3(i,j)=bcnt(index(i,j));
end


 plot(z,bcnt,'*')
 hold on





% figure
%  plot(z,bex,'s')
%  hold on
end

plot(x,sol(1000,:),'k')
title('CN')
xlabel('\zeta','fontsi',20)
ylabel('\theta','fontsi',20)
legend('n=5','n=9','n=17','n=33','n=49','exact')
figure
for i=1:numel(nReng)-1
    n=nReng(i);
    h(i)=1/(n-1);
    for j=1:numel(z1)-1
    err(i,j)=abs(i3(i+1,j)-i3(i,j));
    
    end
    loglog(h,err,'*')
    
end
title('solution convergence(CN)')
xlabel('h','fontsi',10)
ylabel('successive error','fontsi',10)
legend('\zeta=0.25','\zeta=0.5','\zeta=0.75','\zeta=1')
for q=1:numel(z1)-1
    
    for m=1:numel(nReng)-2
   slop(m,q)=(log((err(m+1,q))/err(m,q)))/(log(h(m+1)/h(m)));
    
    end
    
    
end
