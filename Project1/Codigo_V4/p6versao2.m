tempo_max = 25;
flag_plotEL = true;
flag_plotPD = false;
flag_plotPK = false;
dose = 3;
intervalo = 3;
flag_intervalo_const = true;
flag_const_res = true;
for const_resistencia = 0 : 1 : 10
    EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
end
const_resistencia = 3;
flag_plotEL = false;
flag_plotPD = false;
for dose = 5.6
    [V,t] = EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
    figure(5)
    hold all
    str = strcat('V(t) | dose = ', num2str(dose),' | r =', int2str(const_resistencia));
    gg = plot(t, V,'DisplayName', str);
    legend('-DynamicLegend');
    set(gg, 'LineWidth', 1.5);
    title('Gráfico do volume do tumor em função do tempo');
    xlabel('t (dias)');
    ylabel('V (t)[mm^3]');
end
grid;
yline(0.1);