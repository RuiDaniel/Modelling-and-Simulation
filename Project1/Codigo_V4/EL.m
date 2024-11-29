function [V, t] = EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res)
    % Definição de variaveis    
    a = 0.09;
    Kt = 10;
    b = 1;
    V = zeros(1);
    V(1) = 1; % Volume inicial
    h = 1;
    [u, t] = PD(tempo_max, flag_plotPK, flag_plotPD, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
    for k = 1 : tempo_max
        der = a * V(k) * (1 - V(k) / Kt) - b * u(k) * V(k); % Método de Euler
        V(k + 1) = V(k) + h * der;
    end
    if flag_plotEL
        figure(4)
        hold all
        if flag_const_res
            str = strcat('V(t) | intervalo =', int2str(intervalo), ' | r =', num2str(const_resistencia));
        else
            if ~flag_intervalo_const
                str = strcat('V(t) | intervalo = progressão aritmética de razão 1, valor inicial = 3, valor final =', int2str(intervalo), ', valor estabiliza após atingir máximo');
            else
                str = strcat('V(t) | intervalo =', int2str(intervalo));
            end
        end
        
        gg = plot(t, V, 'DisplayName', str);
        legend('-DynamicLegend');
        set(gg, 'LineWidth', 1.5);
        title('Gráfico do volume do tumor em função do tempo');
        grid;
        xlabel('t (dias)');
        ylabel('V (t)[mm^3]');
    end
end
