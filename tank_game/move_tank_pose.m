function group = move_tank_pose(group, map)


% New Tank Position
commandwindow; %activate command window
dist = 0;

while true

    % user input distant to move
    dist = input("Move how many meters (+ is right, - is left)? ");
    
    while abs(dist) > 5
        disp("Can't move more than 5m, try again.")
        dist = input("Move how many meters (+ is right, - is left)? ");
    end

    new_pose = group.tank(group.turn).pose + dist;

    if new_pose >= map.boundaries(1) && new_pose <= map.boundaries(2)
        break % gets out of the while loop
    end

    disp("Can't move outside the map boundaries, try again")

end

% update the tank's pose
group.tank(group.turn).pose = group.tank(group.turn).pose + dist;

end