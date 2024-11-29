tempo_max = 25;
flag_plotEL = true;
flag_plotPD = false;
flag_plotPK = false;
flag_intervalo_const = true;
flag_const_res = false;
dose = 3;
intervalo = 6;
const_resistencia = 0;
for k = 1 : 6
    [V,t] = EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
    intervalo = intervalo - 1;
end
for k= 1 : tempo_max + 1
    y(k)= 0.1;
end
figure(4)
hold all
gg = plot(t, y, 'DisplayName', 'V = 0.1');
legend('-DynamicLegend');
set(gg, 'LineWidth', 0.5);
title('Gráfico do volume do tumor em função do tempo');
grid;
xlabel('t (dias)');
ylabel('V (t)[mm^3]');