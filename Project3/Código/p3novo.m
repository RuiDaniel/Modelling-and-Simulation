out = sim('Msimlab3parte3',10);
outz = sim('Msimlab3',13);
figure(2)
    gg = plot(out.z, outz.z);
    set(gg,'LineWidth',1.5);
    title('Gráfico de z em função do tempo');
    xlabel('Tempo(s)');
    ylabel('z(m)');
    xlim([0 10]);
    legend('{/alpha} = 0,8 para y < 30m; {/alpha} = 0,4 para y ≥ 30m', '{/alpha} = 0,8');
    grid;