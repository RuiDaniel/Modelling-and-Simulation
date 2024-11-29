tempo_max = 1000;
flag_plotEL = true;
flag_plotPD = true;
flag_plotPK = false;
flag_const_res = true;
dose = 3;
intervalo = 3;
flag_intervalo_const = true;
for const_resistencia = 0 : 1 : 10
    EL(tempo_max, flag_plotEL, flag_plotPD, flag_plotPK, dose, intervalo, flag_intervalo_const, const_resistencia, flag_const_res);
end