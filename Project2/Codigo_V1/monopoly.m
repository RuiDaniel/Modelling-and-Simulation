function [z, y, avancador, zfreq, lucro, zfreqfinal] = monopoly(Njogadas, NMC, Ndiscard, Ncasas)
    z = zeros(1, Ncasas);                   % Número de vezes que se caiu em cada estado
    zfinal = zeros(1,Ncasas);               % Número de vezes que o jogo acabou em cada estado
    zfreq = zeros(1,Ncasas);                % Frequências relativas de cada estado
    zfreqfinal = zeros(1,Ncasas);           % Probabilidade de o jogo terminar em cada estado
    y = zeros(1, Njogadas);                 % Casa em que se caiu em cada jogada
    avancador = zeros(1, Njogadas);         % Vetor que armazena os sucessivos acontecimentos 
    Aluguer = [10, 10, 0, 15, 20, 25, 35];  % Valor do aluguer de cada casa
    x = 0;                                  % Estado atual     
    NVoltas = 0;
    for i = 1 : NMC
        x = 0;
        for j = 1 : Njogadas
            avanca = randi(2,1); % Número de casas a avançar no tabuleiro,
            % dado pelo valor obtido no lançamento da moeda: 1 = Cara, 2 = Coroa
            if x == 7            % Se o jogador estiver no estado 7 é equivalente que este avance
                x = x - 7;  
                NVoltas = NVoltas + 1; % do estado 7 ou do estado (imaginário) 0
            end
            x = x + avanca;
            if x == 7       % Prisão: jogador estava no estado 5 e avançou 2 casas (5 + 2 = 7) 
                x = 3;
                NVoltas = NVoltas + 1; % ou jogador estava no estado 6 e avançou 1 casa (6 + 1 = 7)
            end
            if x == 8       % Caso em que avançamos do estado 6 para o estado 7 
                x = x - 1;  % (avança 2 casas, mas apenas aumenta em 1 estado)
            end
            y(j) = x;
            avancador(j) = avanca;
            if j > Ndiscard
                z(x) = z(x) + 1;
            end
        end
            zfinal(x)=zfinal(x) + 1;
    end
    NVoltas;
    zfreqfinal = zfinal./NMC;
    zfreq = z ./ ((Njogadas - Ndiscard) * NMC); 
    lucro = zfreq .* Aluguer;                   % Rendas médias espectáveis de cada estado
end

