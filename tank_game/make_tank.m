function [tank] = make_tank(name, size_of_battlefield)

% Create New Tank
tank.pose = round(rand(1)*size_of_battlefield,1);
tank.launchspeed = 1;
tank.angle = 45;
tank.name = string(name);
tank.orient = "L";
tank.health = 2;
tank.traj.x = [];
tank.traj.y = [];
tank.traj.t = [];
tank.traj.flag = 0;

end