function [m,x1]=armjforproarc(x0,Q,b,sigma,beta,s_bar)
% Ñ°ÕÒÂú×ãarmj rule µÄm
m=0;
f0=f(Q,b,x0);
fx0=fx(Q,b,x0);
while 1
        p=x0-beta^m*s_bar*(fx0);
        x1=projection(p);
        f1=f(Q,b,x1);
        if (f0-f1-sigma*(fx0)'*(x0-x1))>=0 
            break;
        end
        m=m+1;
end
end