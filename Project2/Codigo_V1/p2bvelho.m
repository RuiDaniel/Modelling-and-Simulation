Njogadas = 100;
NMC = [1,10,100,1000,10000, 100000];
Ndiscard = 20;
Ncasas = 7;
zfreq2D=zeros(6,Ncasas);
for p = 0
    rand('state',p);
    for j = 1 : 6
        k = NMC(j); 
        [z, y, avancador, zfreq, lucro] = monopoly(Njogadas, k, Ndiscard, Ncasas, false);
        for m = 1:Ncasas
            zfreq2D(j,m) = zfreq(1,m);
        end
    end
        figure(p+1)
            bar3(zfreq2D);
            title('Gráfico das frequencias relativas para diferente número de runs');
            xlabel('Estado');
            ylabel('Número de runs');
            set(gca,'YTick',[1 2 3 4 5 6] );
            set(gca,'YTickLabel',[1 10 100 1000 10000 100000'] );
            zlabel('Frequência relativa');
end