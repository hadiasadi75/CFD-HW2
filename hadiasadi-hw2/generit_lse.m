function [z,s,s1,s2,s3,s4]=generit_lse(n,mu,Bi,dz,nu,dt)
z=linspace(0,1,n);
[I,J,V,V1,V2,V3,V4]=initilize_variables(n);
[I,J,V,V1,V2,V3,V4]=internal_coff(I,J,V,V1,V2,V3,V4,dt,mu,nu,n);
[I,J,V,V1,V2,V3,V4]=left_bc(I,J,V,V1,V2,V3,V4,n);
[I,J,V,V1,V2,V3,V4]=right_bc(I,J,V,V1,V2,V3,V4,dz,mu,n,Bi);
s=sparse(I,J,V);
s1=sparse(I,J,V1);
s2=sparse(I,J,V2);
s3=sparse(I,J,V3);
s4=sparse(I,J,V4);
end


