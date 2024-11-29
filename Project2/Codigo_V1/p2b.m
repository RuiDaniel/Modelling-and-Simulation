Njogadas = 2000;
zfreq_teo=[0.045, 0.068, 0.250, 0.159, 0.205, 0.182, 0.091];
NMC = 1:100;
Ndiscard = 19;
Ncasas = 7;
zfreq2D=zeros(5,Ncasas);
erro = zeros(1,length(NMC));
erro_geral = zeros(1,length(NMC));
for p = 0:100
    rand('state',p);
        for j = 1 : length(NMC)
            [z, y, avancador, zfreq, lucro, zfreqfinal] = monopoly(Njogadas, NMC(j), Ndiscard, Ncasas);
            vect_erro = (zfreq_teo - zfreq)./zfreq_teo;
            erro(j) = sum(abs(vect_erro),'all');
        end
        erro_geral = erro_geral + erro;
%         figure(p+1)
%             gg = plot(erro);
%             set(gg,'LineWidth',1.5);
%             title('Gráfico dos erros relativos em função do número de runs');
%             xlabel('Número de runs');
%             ylabel('Erro relativo');
% %             set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10] );
% %             set(gca,'XTickLabel',[1 4 9 16 25 36 49 64 81 100'] );
%             grid;
end
erro_geral = erro_geral./(p+1);
figure(p+2)
    gg = plot(erro_geral);
    set(gg,'LineWidth',1.5);
    title('Gráfico dos erros relativos em função do número de runs');
    xlabel('Número de runs por seed');
    ylabel('Erro relativo');
    %set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10] );
    %set(gca,'XTickLabel',[1 4 9 16 25 36 49 64 81 100'] );
    grid;