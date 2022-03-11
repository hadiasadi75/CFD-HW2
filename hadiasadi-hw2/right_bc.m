function [I,J,V,V1,V2,V3,V4]=right_bc(I,J,V,V1,V2,V3,V4,dz,mu,n,Bi)

    k=(3*(n-1)-1)+(1:2);
    I(k)=n;
    J(k)=[n-1,n];
    V(k)=[-1.0,1.0+Bi*dz];
    %V(k)=[-2.0,2.0+(mu*dz)^2+2*Bi*dz];
    V1(k)=[-1.0,1.0+Bi*dz];
    V2(k)=[-1.0,1.0+Bi*dz];
    V3(k)=[-1.0,1.0+Bi*dz];
     V4(k)=[-1.0,1.0+Bi*dz];
end