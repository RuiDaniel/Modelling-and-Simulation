rand('state', 0);
tamanho = 6;
Njogadas = tamanho;
Ncasas = 7;
zfreq2D=zeros(21,7);
teorico = [0.045, 0.068, 0.250,0.159, 0.205, 0.182, 0.091];
erros = zeros(1, tamanho);
zfreqfinalmedia = zeros(1, 7);
NMaxNMC = 10000;
for NMC = 10000
    for Ndiscard = 0
        [z, y, avancador, zfreq, lucro,zfreqfinal] = monopoly(Njogadas, NMC, Ndiscard, Ncasas);
        erros(Ndiscard+1) = sum(abs((zfreq - teorico)./teorico));
        minimo = 2;
        zfreqfinalmedia = zfreqfinalmedia + zfreqfinal;
    end
end

zfreqfinalmedia = zfreqfinalmedia./ NMaxNMC;

