rand('state', 0);
tamanho = 50;
Njogadas = tamanho;
Ncasas = 7;
zfreq2D=zeros(21,7);
teorico = [0.045, 0.068, 0.250,0.159, 0.205, 0.182, 0.091];
erros = zeros(1, tamanho);
frequencia = zeros(1,50);
NMaxNMC = 2000;
for NMC = 1 : 1 : NMaxNMC
    for Ndiscard = 0 : tamanho
        [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
        erros(Ndiscard+1) = sum(abs((zfreq - teorico)./teorico));
    end
    minimo = 2;
    for k = 3 : tamanho
        if erros(k) < erros(minimo)
            minimo = k;
        end
    end
    frequencia(minimo) = frequencia(minimo) + 1;
    NMC
end

max = 1;
for k = 2 : 50
    if(frequencia(k) > frequencia(max))
        max = k;
    end
end
max - 1

t = 0 : 1 : tamanho-1;
figure(1)
    gg = plot(t, frequencia,'-');
    set(gg,'LineWidth',1.5);
    hold on;
    title('Gráfico do número de ocorrência ótimas para cada Ndiscard, com 1000 amostras');
    xlabel('Ndiscard');
    ylabel('Número de ocorrências');
    grid;
    xlim([0 tamanho])
    hold on