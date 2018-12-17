function show_triangulation(X)
plot3(X(1,:), X(3,:), X(2,:), 'rx', 'LineWidth', 2);
hold on;
for i = 1 : size(X,2) 
   text(X(1,i), X(3,i), X(2,i), num2str(i)) ;
end;
hold off;
axis equal; 
grid on;
rotate3d on;
