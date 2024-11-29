parede = 30;
Tfinal = 20;
out = sim('Msimlab3parte4',Tfinal);
h = figure(1);
axis([-35 parede 0 11])
hold on
curve=animatedline;
set(gca,'Xlim',[-35 parede])
title('Gráfico animada de z em função y com parede em y = 30m');
xlabel('y(m)');
ylabel('z(m)');
xlim([-35,30]);
grid;
% axis tight manual % this ensures that getframe() returns a consistent size
filename = 'p4_30.gif';
for ii = 1 :100: length(out.z.time)
    addpoints(curve,out.y.data(ii),out.z.data(ii));
    drawnow
    ii
    %pause(0.01)
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if ii == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
hold off