function [killzone, group] = shoot_tank(group)
% Input is tank that is doing the shooting/firing of missile
% output is the killzone [killzone_min killzone_max]
tank = group.tank(group.turn);

% Range Equation to Compute Distance Missile Travels
R = (tank.launchspeed^2) * sind(2*tank.angle) / 9.81;

% Calc Location Missile will Hit
if sum(tank.orient == ["L","l"]) > 0 %tank facing left
    killpoint = tank.pose - R;
else %tank facing right
    killpoint = tank.pose + R;
end

% Calc Region of Death around Missile
width = 0.5; %tunable for tougher/easier target hitting 
killzone = [(killpoint + width), (killpoint - width)];

% Calculate Missile Trajectory
g = 9.81; %gravity, m/s2
t_full = 2*tank.launchspeed*sind(tank.angle)/g; % time of missile travel
t = linspace(0,t_full,18); %18 evenly spaced values between 0 to t_full
y = 0 + tank.launchspeed*sind(tank.angle)*t - 0.5*g*t.^2;
x = [];
if sum(tank.orient == ["L","l"]) > 0 %tank facing left
    x = tank.pose - tank.launchspeed*cosd(tank.angle)*t;
else %tank facing right
    x = tank.pose + tank.launchspeed*cosd(tank.angle)*t;
end

% Save trajectory to Tank
tank.traj.x = x;
tank.traj.y = y;
tank.traj.t = t;
tank.traj.flag = 1; % use this as indicator that there's a trajectory to plot!

group.tank(group.turn) = tank;



end