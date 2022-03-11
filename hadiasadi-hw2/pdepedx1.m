
function [c,f,s] = pdepedx1(x,t,u,DuDx)
    c = 1;
    f = DuDx;
    s = 2*u;
end