tempo_max = 150;
faz_graficos = true;
dose = 3;
intervalo = 6;
flag_intervalo_const = true;

[c, t]= PK(tempo_max, faz_graficos, dose, intervalo,flag_intervalo_const);