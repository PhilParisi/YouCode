% Gradient Descent Algorithm
    % finding local Minima
clc, clearvars, close all

%%% Main Function
f = @(x,y) 1/4*x.^2 + y.^2;         % anonymous function
syms fs xs ys
fs = 1/4*xs.^2 + ys.^2;             % symbolic expression

%%%  and Visualization
x = -5:.2:5;
y = -5:.2:5;
[X,Y] = meshgrid(x,y);
Z = f(X,Y);

surf(X,Y,Z), hold on
xlabel('x'),ylabel('y'),zlabel('z')

%%% Gradient Descent (find minima)
    % gen equation: z2 = z1 - alpha*gradient(f(x,y)), alpha is learning rate

% Setup Equation (partial derivatives -- do analytically or using MATLAB)
Df_x = diff(fs,xs);                 % symbolic expression
Df_y = diff(fs,ys);

grad_x = matlabFunction(Df_x);      % symbolic --> anonymous function
grad_y = matlabFunction(Df_y);

% Initial Conditions (where do we start on the map?)
pts(1,1) = 4;                       % initial x position
pts(1,2) = 5;                       % initial y position
pts(1,3) = f(pts(1,1),pts(1,2));    % initial z position
alpha = 0.1;                        % learning rate


% Algorithm
err_x = 5; err_y = 5;
i = 1;
while err_x > 0.01 || err_y > 0.01

    % Calculate next x,y,z (subtract partial derivs)
    pts(i+1,1) = pts(i,1) - alpha*grad_x(pts(i,1)); %x
    pts(i+1,2) = pts(i,2) - alpha*grad_y(pts(i,2)); %y
    pts(i+1,3) = f(pts(i+1,1),pts(i+1,2)); %z (from x,y)

    % Update difference between consecutive points
    err_x = abs(pts(i+1,1) - pts(i,1));
    err_y = abs(pts(i+1,2) - pts(i,2));
    
    % increment i (move to next row)
    i = i + 1;

    % break loop if going too long
    if i > 200
        break
    end
end


% Plot the Path of Points
scatter3(pts(:,1),pts(:,2),pts(:,3),...
    'r','filled')

% Output
fprintf("Reached target in %d iterations\n",length(pts))
fprintf("Final pt is (x=%1.2f,y=%1.2f,z=%1.2f)\n",pts(end,1),pts(end,2),pts(end,3))


axis off
set(gca,'color','none')
set(gcf,'color','none')



%%

% Gradient Ascent Algorithm
    % finding local Maxima
clc, clearvars, close all

%%% Main Function
f = @(x,y) -1/4*x.^2 - y.^2;         % anonymous function
syms fs xs ys
fs = -1/4*xs.^2 - ys.^2;             % symbolic expression

%%%  and Visualization
x = -5:.2:5;
y = -5:.2:5;
[X,Y] = meshgrid(x,y);
Z = f(X,Y);

surf(X,Y,Z), hold on
xlabel('x'),ylabel('y'),zlabel('z')

%%% Gradient Ascent (find maxima)
    % gen equation: z2 = z1 - alpha*gradient(f(x,y)), alpha is learning rate

% Setup Equation (partial derivatives -- do analytically or using MATLAB)
Df_x = diff(fs,xs);                 % symbolic expression
Df_y = diff(fs,ys);

grad_x = matlabFunction(Df_x);      % symbolic --> anonymous function
grad_y = matlabFunction(Df_y);

% Initial Conditions (where do we start on the map?)
pts(1,1) = 4;                       % initial x position
pts(1,2) = 5;                       % initial y position
pts(1,3) = f(pts(1,1),pts(1,2));    % initial z position
alpha = 1;                        % learning rate


% Algorithm
err_x = 5; err_y = 5;
i = 1;
while err_x > 0.01 || err_y > 0.01

    % Calculate next x,y,z (add partial derivs)
    pts(i+1,1) = pts(i,1) + alpha*grad_x(pts(i,1)); %x
    pts(i+1,2) = pts(i,2) + alpha*grad_y(pts(i,2)); %y
    pts(i+1,3) = f(pts(i+1,1),pts(i+1,2)); %z (from x,y)

    % Update difference between consecutive points
    err_x = abs(pts(i+1,1) - pts(i,1));
    err_y = abs(pts(i+1,2) - pts(i,2));
    
    % increment i (move to next row)
    i = i + 1;

    % break loop if going too long
    if i > 200
        break
    end
end


% Plot the Path of Points
scatter3(pts(:,1),pts(:,2),pts(:,3),...
    'r','filled')

% Output
fprintf("Reached target in %d iterations\n",length(pts))
fprintf("Final pt is (x=%1.2f,y=%1.2f,z=%1.2f)\n",pts(end,1),pts(end,2),pts(end,3))
