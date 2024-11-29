n_amostras = 1000000;
c50 = 7.1903;
for k = 1 : n_amostras
    c(k)= 0.01 * k;
end
for k = 1 : n_amostras
    u(k) = c(k) / (c50 + c(k));
end
figure(3)
gg = semilogx(c, u);
set(gg,'LineWidth',1.5);
title('Gráfico do efeito da medicação em função da concentração de efeito');
grid;
xlabel('Concentração de efeito [mg / kg]');
ylabel('u (c)');
hold all;

        