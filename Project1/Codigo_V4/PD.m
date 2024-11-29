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

function [u, t] = PD(tempo_max, flag_plotPK, flag_plotPD, dose, intervalo,flag_intervalo_const, const_resistencia, flag_const_res)
    c50 = 7.1903;
    [c, t]= PK(tempo_max, flag_plotPK, dose, intervalo, flag_intervalo_const);
    
    % Cálculo do efeito u(t) 
    for k = 1 : tempo_max + 1
        u(k) = c(k) / (c50 + c(k));
        if const_resistencia
            % Limiar a partir do qual c50 aumenta, ou seja, as células cancerígenas ganham resistência
            limiar = 1.5;
            if 0 < c(k) && c(k) < limiar
                c50 = c50 + const_resistencia * (limiar - c(k));
            end
        end
    end
    
    % Producao de gráficos
    if flag_plotPD
        figure(2)
        hold all
        if flag_const_res
            str = strcat('u(t) | d =', int2str(dose), ' | r =', num2str(const_resistencia));
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
    end
end