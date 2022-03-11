function [I,J,V,V1,V2,V3,V4]=internal_coff(I,J,V,V1,V2,V3,V4,dt,mu,nu,n)
for i=2:(n-1)
    k=(3*(i-2))+(1:3);
    I(k)=i;
    J(k)=[i-1,i,i+1];
    V(k)=[nu,-(2*nu+(mu*dt)-1),nu];
    V1(k)=[-nu,+(2*nu+(mu*dt)+1),-nu];
     V2(k)=[2*nu,-(4*nu+(2*mu*dt)),2*nu];
     V3(k)=[0.5*nu,-(nu+(mu*dt)-1),0.5*nu];
    V4(k)=[-0.5*nu,+(nu+1),-0.5*nu];
end 

end