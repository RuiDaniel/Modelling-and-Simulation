out = sim('Msimlab3',13);
figure(1)
    gg = plot(out.v);
    set(gg,'LineWidth',1.5);
    title('Gráfico de v_z em função do tempo','Interpreter','tex');
    xlabel('Tempo(s)');
    ylabel('v_z(m/s)','Interpreter','tex');
    xlim([0 13]);
    grid;
figure(2) 
    gg = plot(out.z);
    set(gg,'LineWidth',1.5);
    title('Gráfico da posição z em função do tempo');
    xlabel('Tempo(s)');
    ylabel('z(m)');
    xlim([0 13]);
    grid;