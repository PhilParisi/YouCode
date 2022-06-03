function [group] = group_tank(tank_names, size_of_battlefield)

% Construct the initial group mega-struct
for i = 1:length(tank_names)   
    group.tank(i) = make_tank(tank_names(i),size_of_battlefield);
end

% Go thru and respawn if tanks are too close to each other (brute force)
while sum( diff(abs(cell2mat({group.tank.pose}))) < 2) > 0
    for i = 1:length(tank_names)
        group.tank(i) = make_tank(tank_names(i), size_of_battlefield);
    end
end

% Display Tanks Ready for Battle
for i = 1:length(tank_names)
    disp(strcat(group.tank(i).name," is ready for battle!"))
end
fprintf("...\n")

% Establish num attribute
group.num = length(tank_names);

% Who goes first
group.turn = randi(group.num);
%disp(strcat(string(group.tank(group.turn).name)," goes first!"))


end