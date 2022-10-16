% Making 3D Plots
% Phil's Beginner Code - Oct 2022
clc, clearvars, close all

%%%% APPROACH
% - define x, y, and z as 1xn vectors
% - use plot3(x,y,z) to plot 3D pts in space

%%%% VARIABLES
t = 0:0.1:10;
x = sin(2*t);   x2 = sin(2*t + pi);
y = cos(2*t);   y2 = cos(2*t + pi);
z = t;          z2 = t;

%%%% PLOT in 3D
plot3(x,y,z,'.')
axis equal
hold on
plot3(x2,y2,z2,'.')

xlabel('x'),ylabel('y'),zlabel('z')
title('Double Helix')