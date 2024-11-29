doses = [1:100];
tempo_max = 1500;
flag_plotPK = false;
flag_plotPD = false;
intervalo = 6;
flag_intervalo_const = true;
const_resistencia = 0;
flag_const_res = false;
for k = 1 : length(doses)
    [u,t] = PD(tempo_max, flag_plotPK, flag_plotPD, doses(k), intervalo,flag_intervalo_const, const_resistencia, flag_const_res);
    last_u(k)=u(tempo_max+1);
end
figure(3)
hold all
gg = plot(doses, last_u);
set(gg,'LineWidth', 1.5);
title('Gráfico do efeito da medicação em função da dose');
grid;
xlabel('dose(mg)');
ylabel('u (dose)');