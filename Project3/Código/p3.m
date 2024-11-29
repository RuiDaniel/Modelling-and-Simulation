b = -0.4;
out = sim('Msimlab3parte3',10);
b = -0.8;
outz = sim('Msimlab3parte3',10);
% figure(2)
%     gg = plot(out.z);
%     set(gg,'LineWidth',1.5);
%     title('Gráfico de z em função do tempo');
%     xlabel('Tempo(s)');
%     ylabel('z(m)');
%     xlim([0 10]);
%     grid;
%     
% figure(3)
% true_vy=zeros(1,11);
% t=zeros(1,11);
%     for i=1:11
%         true_vy(i)=10;
%         t(i)=i-1;
%     end
%     gg = plot(t,true_vy);
%     set(gg,'LineWidth',1.5);
%     title('Gráfico de v_y em função do tempo');
%     xlabel('Tempo(s)');
%     ylabel('v_y(m/s)');
%     xlim([0 10]);
%     ylim([0 12]);
%     grid;
%     
% figure(4)
%     gg = plot(out.y);
%     set(gg,'LineWidth',1.5);
%     title('Gráfico de y em função do tempo');
%     xlabel('Tempo(s)');
%     ylabel('y(m)');
%     xlim([0 10]);
%     grid;
%     
figure(5)
    gg = plot(out.y.data,out.z.data,'-',outz.y.data,outz.z.data,'--');
    set(gg,'LineWidth',1.5);
    title('Gráfico de z em função y');
    xlabel('y(m)');
    ylabel('z(m)');
    xlim([0,100]);
    legend('\alpha = 0,8 para y < 30m; \alpha = 0,4 para y ≥ 30m', '\alpha = 0,8');
    grid;
    
% figure(1)
%     gg = plot(out.vz);
%     set(gg,'LineWidth',1.5);
%     title('Gráfico de v_z em função do tempo','Interpreter','tex');
%     xlabel('Tempo(s)');
%     ylabel('v_z(m/s)','Interpreter','tex');
%     xlim([0 10]);
%     grid;