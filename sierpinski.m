clf;
hold on;
height = 100
for y=0:height-1
    for x=0:y
        if bitand(x,(y-x)) == 0
           plot(x+height-.5*y,height/2-(y),'r.');
       end
    end
end
set(gca,'FontSize',14);
set(gcf,'Color',[1,1,1]);
title('The Sierpiski Gasket');
hold off;
