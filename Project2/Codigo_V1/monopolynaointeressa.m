function [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, NMC, Ndiscard, Ncasas, flag_final)
    z = zeros(1, Ncasas);                                    % Número de vezes que se caiu em cada estado
    y = zeros(1, Njogadas);                                  % Casa em que se caiu em cada jogada
    avancador = zeros(1, Njogadas);                          % Valor de avanca em cada jogada
    Aluguer = [10, 10, 0, 15, 20, 25, 35];                   % Valor do aluguer de cada casa
    x = 0;                                                   % Estado atual
    for i = 1 : NMC
        x = 0;
        for j = 1 : Njogadas
            avanca = randi(2,1);
            if x == 7                     % Se x está a 7, avançar de 7 ou de 0 é igual, logo coloca-se x a 0 para evitar problemas
                x = x - 7;
            end
            x = x + avanca;
            if x == 7                      %prisão
                x = 3;
            end
            if x == 8                      % Caso em que avançamos do estado 6 para o estado 7 (avança duas casas mas só avança 1 estado)
                x = x - 1;
            end
            y(j) = x;
            avancador(j) = avanca;
            if j > Ndiscard && flag_final == false
                z(x) = z(x) + 1;
            end
        end
        if flag_final
            z(x)=z(x) + 1;
        end
    end
    if flag_final
        zfreq = z./NMC;
    else
        zfreq = z./((Njogadas-Ndiscard) * NMC);
    end
    lucro = zfreq .* Aluguer;
end

