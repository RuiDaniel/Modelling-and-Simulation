rand('state', 0);
Njogadas = 50;
Ndiscard = 0;
NMC = 1000;
Ncasas = 7;
zfreq2D=zeros(21,7);
teorico = [0.045, 0.068, 0.250,0.159, 0.205, 0.182, 0.091];
zfreqestado5 = zeros(1,50);
erros = zeros(1, 50);
for Njogadas = 1:50
    [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
    erros(Njogadas) = sum(abs(zfreq - teorico));
    zfreqestado5(Njogadas) = zfreq(1,5);
end
t = 1 : 1 : 50;
figure(1)
    gg = plot(t, erros, '-');
    set(gg,'LineWidth',1.5);
    title('Gráfico da soma dos módulos erros da probabilidade dos estados face à probabilidade de equilíbrio em função do número de jogadas');
    xlabel('Número de jogadas');
    ylabel('Soma dos módulos dos erros da probabilidade de cada estado face à sua probabilidade de equilíbrio');
    grid;
    xlim([1 50])
    hold on

%figure(2)
%    gg = plot(t, zfreqestado5, '-');
%    set(gg,'LineWidth',1.5);
%    grid;
%    title('Gráfico da evolução da probabilidade do estado 5 em função do número de jogadas');
%    xlabel('Número de jogadas');
%    ylabel('Frequência relativa do estado 5');
%    xlim([1 50])
%    hold on
