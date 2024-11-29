Njogadas = 20;
NMC = 1;
Ndiscard = 20; % neste exemplo não interessa
Ncasas = 7;
rand('state',0);
[z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
figure(1)
    bar(y)
    title('Gráfico dos estados percorridos em função da jogada realizada');
    grid;
    xlabel('Jogada realizada');
    ylabel('Estado');
figure(2)
    bar(avancador,'r');
    title('Gráfico dos avanços em função da jogada realizada');
    a = axis;
    axis([a(1) a(2) 0 2]);
    set(gca, 'YTick', 0:2);
    xlabel('Jogada realizada');
    ylabel('Avanço');