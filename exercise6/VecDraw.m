edge_search_width = 5;
% Determination of search width
c_v_y = -1;
c_v_x = 3;
% Current-Vector
t_v = [0; -(edge_search_width-2)];
% Top-Vector, shows always to the top. x = 0, y = -edge_search_width.
% Calculations for quiver-command in the visualisation.
o = [0; 0];
c_v = [c_v_x; c_v_y];
ac = [c_v o];
auv = [o c_v];
bc = [t_v o];
buv = [o t_v];
%%Visualisation
figure2 = figure;
% create figure
axes2 = axes('Parent',figure2);
hold(axes2,'on');
% create axes
figure2.Name = 'vectors in searchmask';
figure2.NumberTitle = 'off';
% create title of the window
axes2.XLim = [ (-(round((edge_search_width/2)+1))) (round((edge_search_width/2)+1))];
axes2.YLim = [ (-(round((edge_search_width/2)+1))) (round((edge_search_width/2)+1))];
axes2.XAxisLocation = 'origin';
axes2.YAxisLocation = 'origin';
axes2.YDir = 'reverse';
% set axes to the origion
quiver(ac(1,:), ac(2,:), auv(1,:), auv(2,:), 0)
hold on
quiver(bc(1,:), bc(2,:), buv(1,:), buv(2,:), 0)
hold off
% plot vectors
box(axes2,'on');
% appearance of the figurn zum Aussehen des Schaubildes