tempo_max = 10000;
flag_plotEL = true;
flag_plotPD = false;
flag_plotPK = false;
flag_intervalo_const = false;
flag_const_res = false;
dose = 3;
intervalo = 21;
const_resistencia = 0;
EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
intervalo = 22;
EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
figure(4)
grid;