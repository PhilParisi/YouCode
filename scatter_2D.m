% Making 2D Scatter Plots
% Phil's Beginner Code - Oct 2022
clc, clearvars, close all

%%%% APPROACH
% - use a scatter plot to visualize MANY variables
% - define x, y to be plotted in 2D space (similar to plot())
% - define and size and color features

%%%% VARIABLES
x = 0:0.1:10;                               % position
y = x + 2*rand(1,length(x));                % temperature increase

sizes = 20*abs(randn(1,length(x))) + 5*x;   % strain measurement
colors = ones(1,floor(length(x/2))) + x.^3; % pressure measurement

% Make the Scatter Plot
scatter(x,y,sizes,colors,'filled'), grid on
xlabel('Position'),ylabel('Temperature Increase'),title('Pipe Inspection')
text(5,3,'size indicates strain')
text(5,2,'color indicates pressure')
bar = colorbar();
ylabel(bar,'Pressure','FontSize',12)