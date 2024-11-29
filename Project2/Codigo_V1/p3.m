rand('state', 0);
NMC = 100000;
Ndiscard = 0;
Ncasas = 7;
prob4 = zeros(1,20);
flag_final = true;
for Njogadas = 1:20
    [z, y, avancador, zfreq, lucro, zfreqfinal] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
    prob4(Njogadas) = zfreqfinal(4);
end
figure(1)
    bar(prob4)
    title('Gráfico da probabilidade de estar no estado 4 ao longo das sucessivas jogadas');
    grid;
    xlabel('Jogada');
    ylabel('Probabilidade de estar no estado 4');
