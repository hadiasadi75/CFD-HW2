function [pl,ql,pr,qr] = pdepebc(xl,ul,xr,ur,t)
    pl = ul-1;
    ql = 0;
    pr =-0.1*ur;
    qr = 1;
end