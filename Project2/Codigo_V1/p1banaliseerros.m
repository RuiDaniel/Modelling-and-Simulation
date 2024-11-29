rand('state', 0);
tamanho = 1000;
Njogadas = tamanho;
NMC = 1;
Ncasas = 7;
zfreq2D=zeros(21,7);
teorico = [0.045, 0.068, 0.250,0.159, 0.205, 0.182, 0.091];
erros = zeros(1, tamanho);
erros2 = zeros(1, tamanho);
for Ndiscard = 1 : tamanho
    [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
    erros(Ndiscard) = sum(abs(zfreq - teorico));
end
[M,I] = min(erros);
NMC = 5;
for Ndiscard = 1 : tamanho
    [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
    erros2(Ndiscard) = sum(abs(zfreq - teorico));
end
t = 1 : 1 : tamanho;
figure(1)
    gg = plot(t, erros, t, erros2,'-');
    set(gg,'LineWidth',1.5);
    hold on;
    title('Gráfico da soma dos módulos erros da probabilidade dos estados face à probabilidade de equilíbrio em função do número de jogadas');
    xlabel('Ndiscard');
    ylabel('Soma dos módulos dos erros da probabilidade de cada estado face à sua probabilidade de equilíbrio');
    legend('Número de runs = 1', 'Número de runs = 5');
    grid;
    xlim([1 tamanho])
    hold on