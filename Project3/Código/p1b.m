vi=[-10,0,10];
for i = 1 : length(vi)
    out = sim('Msimlab3_2',18);
    figure(1)
        hold all; 
        str = strcat('v_z(t) | v_{inicial z} =', num2str(vi(i)));  
        gg = plot(out.v, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico de v_z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('v_z(m/s)');
        xlim([0 18]);
        grid;
    figure(2)
        hold all; 
        if vi(i)==0
            str = strcat('z(t) | v_{inicial z} =', num2str(vi(i)));
        else
            str = strcat('z(t) | v_{inicial z} =', num2str(vi(i)),' m/s');
        end
        gg = plot(out.z, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico da posição z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('z(m)');
        xlim([0 18]);
        grid;
        hold on;
end