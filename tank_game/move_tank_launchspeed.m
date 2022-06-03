function group = move_tank_launchspeed(group)

launchspeed = 0;

% Tank Launchspeed
while true
    commandwindow;
    launchspeed = input(strcat("Set launch speed to: "));

    if launchspeed > 0
        break
    else
        disp('Launchspeed must be > 0')
    end
    
end

group.tank(group.turn).launchspeed = launchspeed;

end