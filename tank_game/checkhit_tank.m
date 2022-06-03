function group = checkhit_tank(group, killzone)
% input: group and the killzone
% output: group with updated health

% Check if any tanks in the group are within the killzone
% if they are in the killzone, subtract health point
hit_count = 0;
for i = 1:group.num % go thru all tanks to see if in hit zone
    rank_pose = sort([killzone(1),killzone(2),group.tank(i).pose]); % order least to greatest
    if group.tank(i).pose == rank_pose(2) % if our tank is within the killzone
        group.tank(i).health = group.tank(i).health - 1; % lose 1 health point
        hit_count = hit_count + 1; % increase hit_Count
        disp(strcat("!!! ",upper(group.tank(i).name)," HIT !!!"))
        pause(0.5)
    end
end

if hit_count == 0
    disp("...missile misses...")
end

group.tank(group.num).traj.flag = 0; % ensure no more shooting

end
