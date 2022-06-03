% Tank Mainscript
% Parisi - May2022
clc, clearvars, close all, format compact

%%%%%%%%%%%%%%% USER INPUTS TO START

% Name of Tanks (eventually a prompted input
tank_names = ["Mewtwo","Jen","Corin"];

% Size of Battlefield
size_of_battlefield = 20; %m

% Max # of Rounds
max_rounds = 10; % 1 round is all players firing


%%%%%%%%%%%%%%% GAME SETUP

% Develop Group
group = group_tank(tank_names, size_of_battlefield);

% Round Information
group.round_num = 1;
group.loop_num = 1;

% Develop Battlefield
map.boundaries = [0 size_of_battlefield];
map = regen_map(map, group);


%%%%%%%%%%%%%%% START BATTLE

while group.round_num <= max_rounds

    %%%% Round Introductory Info
    disp(strcat(group.tank(group.turn).name,"'s turn!"))
    [map, group] = regen_map(map, group);

    %%%% Tank Actions (for whose turn it is)
    % Display Stats
    stats_tank(group.tank(group.turn));

    % Tank Pose
    group = move_tank_pose(group,map); %update & save tank
    [map, group] = regen_map(map, group);

    % Tank Orientation
    group = move_tank_orient(group);
    [map, group] = regen_map(map, group);

    % Tank Angle
    group = move_tank_angle(group);
    [map, group] = regen_map(map, group);

    % Tank LaunchSpeed
    group = move_tank_launchspeed(group);
    [map, group] = regen_map(map, group);
    

    %%%% Tank Fires Missile

    % Shoot Missile from Tank, Calc Killzone
    [killzone, group] = shoot_tank(group);
    [map, group] = regen_map(map, group);

    % Subtact Tank Health for those inside Killzone
    group = checkhit_tank(group, killzone);
    pause(1)
    [map, group] = regen_map(map, group);


    


    %%%%%% End of Loop Updates
    % Update variables
    if rem(group.loop_num, group.num) == 0
        group.round_num = group.round_num + 1;
        disp(strcat("...Round ",num2str(group.round_num)," begins!..."))
    end
    group.loop_num = group.loop_num + 1; % come after Round check


    group.turn = group.turn + 1;
    if group.turn > group.num
        group.turn = 1;
    end

    % Check if all but one tank is dead, and end game if so
    if checkdead_tank(group) == 1
        disp('game over')
        break
        % FIX THIS, IT SHOULD SAY WHICH TANK WINS, perhaps in the function
    else
        fprintf("...\n...\n...\n")
    end

    
    pause(1)
end

