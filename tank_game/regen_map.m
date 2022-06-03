function [map, group] = regen_map(map, group)
%REGEN_MAP generates the map object

% Gather variable information for the battlefield
for i = 1:group.num
    
    % Tank Pose
    map.pose_x(1,i) = group.tank(i).pose;
    map.pose_y = 0*ones(1,group.num);
    
    % Gun Pose
    length_gun = map.boundaries(2)/15;
    if group.tank(i).orient == "L" %facing left
        map.gun_y(i) = length_gun*sind(group.tank(i).angle);
        map.gun_x(i) = group.tank(i).pose - length_gun*cosd(group.tank(i).angle);
    else %facing right
        map.gun_y(i) = length_gun*sind(group.tank(i).angle);
        map.gun_x(i) = group.tank(i).pose + length_gun*cosd(group.tank(i).angle);
    end

end

% Create the actual figure and plot tanks w/ Names
figure(1); % activate same figure
clf       % clear previous contents on figure

% add new content to figure
plot(map.pose_x,map.pose_y,'rs','markersize',15,'markerfacecolor','r'), hold on
for i = 1:group.num
    plot([map.pose_x(i), map.gun_x(i)],[map.pose_y(i), map.gun_y(i)],'r-','linewidth',4), hold on
    text_str = strcat(group.tank(i).name,", ",num2str(group.tank(i).health)," lives");
    name_h = text(group.tank(i).pose, 0.5, text_str);
    set(name_h,'Rotation',90);
end
grid on, axis equal, xlim([map.boundaries]), ylim([map.boundaries/2])

title(strcat("Round ",num2str(group.round_num)));
xlabel('<-- -x   Position   +x -->')


% Add in Any Trajectories (check the trajectory flag)
if group.tank(group.turn).traj.flag == 1 % if current tank has trajectory
    
    % copy trajectories
    x = group.tank(group.turn).traj.x;
    y = group.tank(group.turn).traj.y;

    pause(1), disp('...firing...')
    temp_line = plot(x(1:1/3*length(x)),y(1:1/3*length(y)),'--k','LineWidth',3);
    pause(1), delete(temp_line) % remove the previous line so we can plot the next
    temp_line = plot(x(1:2/3*length(x)),y(1:2/3*length(y)),'--k','LineWidth',3);
    pause(1), delete(temp_line)
    temp_line = plot(x,y,'--k','LineWidth',3);
    pause(1), delete(temp_line)

    %clear flag and traj
    group.tank(group.turn).traj.flag = 0;
    group.tank(group.turn).traj.x = [];
    group.tank(group.turn).traj.y = [];
    group.tank(group.turn).traj.t = [];

end


group.tank(group.turn).traj.flag = 0;



end

