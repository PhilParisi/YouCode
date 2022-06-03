function tank = move_tank(tank, group)

stats_tank(tank);

% Set Tank Orientation
commandwindow; pause(1)
tank.orient = input("Face Left (L) or Right (R)? ",'s');
commandwindow; %activate command window
while sum(tank.orient == ["L", "R"]) < 1
    disp('Orientation must be capital L or R. Try again.')
    tank.orient = input("Face Left (L) or Right (R)? ",'s');
end
map = regen_map(map, group);
drawnow;

% New Tank Position
dist = input("Move how many meters? ");
commandwindow; %activate command window
tank.pose = tank.pose + dist;
regen_map(group);
drawnow;

% Tank Angle
tank.angle = input(strcat("Set launch angle to: "));
commandwindow; %activate command window
while tank.angle > 90
    disp('Tank angle must be < 90deg. Try again.')
    tank.angle = input(strcat("Set launch angle to: "));
end
regen_map(group);

% Tank Launchspeed
tank.launchspeed = input(strcat("Set launch speed to: "));
commandwindow; %activate command window

%%% Output New Stats
% disp(strcat("-------",string(tank.name),"'s Stats-------"))
% disp(strcat(...
%     "Position = ", num2str(tank.pose),"m", ...
%     ", Oriented ",string(tank.orient), ...
%     ", Launch Angle = ", num2str(tank.angle), ...
%     ", Launch Speed = ", num2str(tank.launchspeed)));
stats_tank(tank);

end