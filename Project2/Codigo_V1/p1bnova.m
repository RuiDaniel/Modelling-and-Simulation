NMC = 1000;
Ndiscard = 0;
Ncasas = 7;
rand('state',0);
Jogadassimuladas = 100;
t = 1 : 1 : Jogadassimuladas;
evolucaozfreq1 = zeros(1, Jogadassimuladas);
evolucaozfreq2 = zeros(1, Jogadassimuladas);
evolucaozfreq3 = zeros(1, Jogadassimuladas);
evolucaozfreq4 = zeros(1, Jogadassimuladas);
evolucaozfreq5 = zeros(1, Jogadassimuladas);
evolucaozfreq6 = zeros(1, Jogadassimuladas);
evolucaozfreq7 = zeros(1, Jogadassimuladas);
for Njogadas = 1 : Jogadassimuladas  
    [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
    evolucaozfreq1(Njogadas) = zfreq(1, 1);
    evolucaozfreq2(Njogadas) = zfreq(1, 2);
    evolucaozfreq3(Njogadas) = zfreq(1, 3);
    evolucaozfreq4(Njogadas) = zfreq(1, 4);
    evolucaozfreq5(Njogadas) = zfreq(1, 5);
    evolucaozfreq6(Njogadas) = zfreq(1, 6);
    evolucaozfreq7(Njogadas) = zfreq(1, 7);
end
figure(1)
    gg = plot(t, evolucaozfreq1, '-');
    set(gg,'LineWidth',1.5);
    hold on
    gg = plot(t, evolucaozfreq5, '-');
    set(gg,'LineWidth',1.5);
    hold on
    legend('Estado 1', 'Estado 5');
    title('Gráfico das frequências relativas do estado 1 e 5, para 1000 runs, ao longo das suas jogadas');
    grid;
    xlabel('Jogadas');
    ylabel('Frequência relativa');