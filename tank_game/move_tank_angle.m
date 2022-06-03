function group = move_tank_angle(group)

% Tank Angle
commandwindow;

while true

    angle = input(strcat("Set launch angle to: "));

    if angle <= 90 && angle >= 0
        break 
    else
        disp('Tank angle must be between 0 and 90.')
    end

end

group.tank(group.turn).angle = angle;

end