function [y, t] = integra_euler(f, cond_inicial, kmax)
    h = 1; % passo de integracao
    y(1)= cond_inicial; % condicao inicial 
    for k = 1 : kmax
        t(k) = (k - 1) * h;
        y(k + 1) = y(k) + h * f(t(k));
    end
    t(k + 1) = k * h;
end