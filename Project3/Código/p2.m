atrito=[0,0.2,0.5];
for i = 1 : length(atrito)
    out = sim('Msimlab3parte2',20);
    figure(1)
        hold all; 
        str = strcat('v_z(t) | const. atrito =', num2str(atrito(i)));  
        gg = plot(out.v, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico de v_z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('v_z(m/s)');
        xlim([0 15]);
    figure(2)
        hold all; 
        str = strcat('z(t) | const. atrito =', num2str(atrito(i)));  
        gg = plot(out.z, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth',1.5);
        title('Gráfico da posição z em função do tempo');
        xlabel('Tempo(s)');
        ylabel('z(m)');
        xlim([0 15]);
        hold on;
end
figure(1)
grid
figure(2)
grid