function group = move_tank_orient(group)


% Set Tank Orientation
commandwindow;
tank_orient = input("Face Left (L) or Right (R)? ",'s');

while sum(tank_orient == ["L", "R", "l", "r"]) < 1
    disp('Orientation must be capital L or R. Try again.')
    tank_orient = input("Face Left (L) or Right (R)? ",'s');
end

% Save new orientation
group.tank(group.turn).orient = upper(tank_orient);


end