out = sim('Msimlab3',13);
h = figure(1);
Tfinal=12.5;
axis([0 Tfinal 0 12])
hold on
curve=animatedline;
set(gca,'Xlim',[0 Tfinal])
grid;
title('Gráfico animado de z em função do tempo');
xlabel('Tempo(s)');
ylabel('z(m)');
% axis tight manual % this ensures that getframe() returns a consistent size
filename = 'p1c.gif';

for ii=1:10:length(out.z.time)
    addpoints(curve,out.z.time(ii),out.z.data(ii));
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

% axis tight manual % this ensures that getframe() returns a consistent size
% filename = 'p1c.gif';
% for n = 1:0.01:5
%       frame = getframe(h); 
%       im = frame2im(frame); 
%       [imind,cm] = rgb2ind(im,256); 
%       % Write to the GIF File 
%       if n == 1 
%           imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
%       else 
%           imwrite(imind,cm,filename,'gif','WriteMode','append'); 
%       end 
% end