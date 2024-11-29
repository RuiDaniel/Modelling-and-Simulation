%function [u, t] = PD(tempo_max, flag_plotPK, flag_plotPD, dose, intervalo,flag_intervalo_const, const_resistencia)
%A função PD implementa o modelo farmacodinâmico que relaciona a
%concentração do fármaco no compartimento de efeito(c) com o efeito, sendo
%este último expresso como um fator adimensional.Recebe os seguintes
%parâmetros:
%tempo_max - número de dias em que se aplica a dose
%flag_plotPK - flag que condiciona a apresentação dos gráficos do PK
%flag_plotPD - flag que condiciona a apresentação dos gráficos do PD
%dose - tamanho da dose por dia [mg/dia]
%intervalo - espaçamento entre tomas do fármaco
%flag_intervalo_const - flag que nos indica se o intervalo de dosagem é constante ou não
%const_resistencia - Variavel tendo em vista o calculo da resistencia das
%celulas cancerigenas

function [u, t] = PD(tempo_max, flag_plotPK, flag_plotPD, dose, intervalo,flag_intervalo_const, const_resistencia)
    c50 = 7.1903;
    % concentração que corresponde a metade do efeito do fármaco em [mg/kg]
    %chamada a PK de modo a obter as várias concentrações ao longo do tempo
    [c, t]= PK_sem_upsample(tempo_max, flag_plotPK, dose, intervalo, flag_intervalo_const);

    % Cálculo do efeito (u) para cada dia 
    for k = 1 : tempo_max + 1
        u(k) = c(k) / (c50 + c(k));
        if const_resistencia
            limiar = 2;    % limiar a partir do qual c50 aumenta, ou seja, as células cancerígenas ganham resistência
            if 0 < c(k) && c(k) < limiar
                c50 = c50 + const_resistencia * (limiar - c(k));
            end
        end
    end
    %Plot do gráfico do efeito do fármaco em função do tempo
    if flag_plotPD
        figure(2)
        hold all
        if const_resistencia
            str = strcat('u(t) | d =', int2str(dose), ' | const resistencia =', num2str(const_resistencia));
        else 
            str = strcat('u(t) | d =', int2str(dose));
        end
        gg = plot(t, u,'DisplayName', str);
        legend('-DynamicLegend');
        set(gg,'LineWidth', 1.5);
        title('Gráfico do efeito da medicação em função do tempo');
        grid;
        xlabel('t (dias)');
        ylabel('u (t)');
        
        %<-------já estava comentado, não fui eu------------>
        %figure(3)
        %gg = plot(c, u, '-');
        %set(gg,'LineWidth',1.5);
        %title('Gráfico do efeito em função da concentração')
        %legend('u(ce)', 'Location', 'northeast');
        %grid;
        %xlabel('ce [mg/kg]')
        %ylabel('u(ce)')
    end
end