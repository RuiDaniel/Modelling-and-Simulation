a=0:0.5:1;
for i = 1 : length(a)
    out = sim('Msimlab3_1',15);
    figure(1)
        hold all; 
        str = strcat('v_z(t) | fator de atenuação =', num2str(a(i)));  
        gg = plot(out.v, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico de v_z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('v_z(m/s)');
        xlim([0 15]);
        grid;
    figure(2)
        hold all; 
        str = strcat('z(t) | fator de atenuação =', num2str(a(i)));  
        gg = plot(out.z, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico da posição z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('z(m)');
        xlim([0 15]);
        grid;
        hold on;
end