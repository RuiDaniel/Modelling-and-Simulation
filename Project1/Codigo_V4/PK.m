%function [c2, t] = PK(tempo_max, flag_plot, dose, intervalo, flag_intervalo_const)
%A função PK implementa o método farmacocinético que representa a relação entre a dose do fármaco ao longo do tempo 
%ao paciente e a concentração fármaco no compartimento de efeito(c2).Recebe como argumentos: 
%tempo_max - número de dias em que se aplica a dose
%dose - tamanho da dose por dia [mg/dia]
%intervalo - espaçamento entre dias em que o paciente recebe o fármaco
%flag_intervalo_const - flag que nos indica se o intervalo de dosagem é constante ou não
%flag_plot - flag que condiciona a apresentação dos gráficos

function [c2, t] = PK(tempo_max, flag_plot, dose, intervalo, flag_intervalo_const)
    %definicao de variaveis
    K12 = 0.3 * 3600;
    K21 = 0.2455 * 3600;
    K10 = 0.0643 * 3600;
    V1 = 3110;
    V2 = 3110;
    delta = 1000;
    h = 1;
    contador = 2;
  
    if flag_intervalo_const
        x = dose + zeros (1, tempo_max);
        d = upsample(x, intervalo);
    else
        %Caso o intervalo pretendido não seja constante o código abaixo criará
        %um vetor com um intervalo cada vez maior, aumentando o número de
        %dias de intervalo a cada iteração
        for k= 1 : tempo_max + 1
            d(k) = 0;
        end
        k=1;
        while k <= tempo_max + 1
            d(k) = dose;
            if contador <= 21
                contador = contador + 1;
            end
            k = k + contador ;
        end
    end
    dplot = zeros(1);
    A = zeros(2, 2);
    b = zeros(2, 1);
    A(1, 1) = (- K12 - K10) / V1;
    A(1, 2) = K21 / V1;
    A(2, 1) = K12 / V2;
    A(2, 2) = - K21/ V2;
    b(1, 1) = 1 / V1;

    der = zeros(2, 1);
    variaveis = zeros(2, 1);

    %assumimos c1(0) = c2(0) = 0
    c1(1) = 0;
    c2(1) = 0;
    
    %Aplicação do método de Euler para calcular os valores de c1
    %e de c2 ao longo do tempo. Vetor t visa a producao de gráficos
    for k = 1 : tempo_max
        variaveis(1, 1) = c1(k);
        variaveis(2, 1) = c2(k);
        der = A * variaveis + b * delta * d(k);
        t(k) = (k - 1) * h;
        c1(k + 1) = c1(k) + h * der(1, 1);
        c2(k + 1) = c2(k) + h * der(2, 1);
    end
    t(k + 1) = k * h;

    % Producao de gráficos
    if flag_plot
        for k = 1 : tempo_max + 1
            dplot(k) = d(k);
        end
        figure(1)
        gg = plot(t, c1, '-', t, c2, '-', t, dplot, 'o-');
        set(gg,'LineWidth',1.5);
        title('Gráfico da concentração de fármaco por compatimento, e da dosagem, em função do tempo')
        legend('c1(t) [mg/kg]', 'c2(t) [mg/kg]', 'd(t) [mg/dia]', 'Location', 'northeast');
        grid;
        xlabel('t (dias)')
        ylabel('Concentração de fármaco (mg/kg)')
    end
end