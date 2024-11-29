Njogadas = 100000;
NMC = 1000;
Ndiscard = 6;
Ncasas = 7;
rand('state',0);
[z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
figure(1)
    bar(zfreq)
    title('Gráfico das frequências relativas dos diferentes estados');
    grid;
    xlabel('Estados');
    ylabel('Frequência relativa');
figure(2)
    bar(lucro,'r');
    title('Gráfico das rendas médias espectáveis das diversas casas');
    xlabel('Estados');
    ylabel('Renda média (€/jogada)');
    grid;