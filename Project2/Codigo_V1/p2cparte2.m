rand('state', 0);
tamanho = 50;
Njogadas = tamanho;
NMC = 100000;
Ncasas = 7;
zfreq2D=zeros(21,7);
teorico = [0.045, 0.068, 0.250,0.159, 0.205, 0.182, 0.091];
erros = zeros(1, tamanho);
erros2 = zeros(1, tamanho);
% for Ndiscard = 0 : tamanho
%     Njogadas = tamanho + Ndiscard;
%     [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
%     erros(Ndiscard+1) = sum(abs((zfreq - teorico)./teorico));
%     Ndiscard
% end
NMC = 1000;
for p = 0 : 50
    rand('state', p);
    for Ndiscard = 0 : tamanho
        Njogadas = tamanho + Ndiscard;
        [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
        erros2(Ndiscard+1) = sum(abs((zfreq - teorico)./teorico));
    end
end
    t = 0 : 1 : tamanho;
figure(1)
    gg = plot(t, erros, t, erros2,'-');
    set(gg,'LineWidth',1.5);
    hold on;
    title('Gráfico da soma dos erros relativos da probabilidade dos estados em função de Ndiscard');
    xlabel('Ndiscard');
    ylabel('Soma dos erros relativos da probabilidade dos estados');
    legend('Número de runs = 100000', 'Número de runs = 1000');
    grid;
    xlim([0 tamanho])
    hold on