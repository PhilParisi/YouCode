% Making 3D Scatter Plots
% Phil's Beginner Code - Oct 2022
clc, clearvars, close all

%%%% APPROACH
% - use a scatter plot to display MANY variables
% - define x, y, and z to be plotted in 3D space (similar to plot3() )
% - define size and color features

%%%% VARIABLES
x = 0:0.01:10;                               % position z
z = cos(10*x);                               % position x 
y = sin(10*x);                               % position y                           
sizes = 5*abs(randn(1,length(x))) + 10*x;    % strain measurement
colors = x.^3;                               % pressure measurement

% Make the scatter plot
scatter3(x,y,z,sizes,colors,'filled'), grid on
xlabel('Position X'), ylabel('Temperature Increase'), zlabel('Position Z')
title('Pipe Inspection')
bar = colorbar();
ylabel(bar,'Pressure','FontSize',12)


%% Grid Based Scatter Plot
clc, clearvars

x = 1:0.1:10;
y = 1:0.1:10;
[X,Y] = meshgrid(x,y);

Z = cos(1/5*X.*Y);

figure
scatter3(X(:), ... % x 1xN, 91x91 --> 1xN 1x8281
         Y(:), ... % y
         Z(:), ... % z
         5, ...    % size
         Z(:), ...  % color
        'filled')

axis equal
title('Topography of Sand Ripples')
bar = colorbar(); ylabel(bar,'height','FontSize',12)
xlabel('x position'),ylabel('y position'),zlabel('height')