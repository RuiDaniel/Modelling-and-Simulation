y=@(x)x^2;
[f,t]=integra(y);
plot(t,f)
function [y,t] = integra(x)
    h=0.001;
    y(1)=0;
    kmax=10000
    for k=1:kmax
        t(k)=(k-1)*h;
        y(k+1)= (x((k-1)*h)*h + y(k));
    end
    t(k+1)=k*h;
end