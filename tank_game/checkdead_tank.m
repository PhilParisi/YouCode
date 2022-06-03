function one_survivor = checkdead_tank(group)

% Count the dead tanks to see how many are dead (and also alive)
dead_tanks = 0;

for i = 1:group.num % loop thru all the tanks
    if group.tank(i).health == 0 % check if their health == 0
        dead_tanks = dead_tanks + 1; % tank is dead, add to counter
    end
end

% Check if all but 1 tank is dead (we have a winner if so!)
if dead_tanks == (group.num - 1) % all but one tank is dead
    one_survivor = 1; % there is only one survivor, end the game!
else
    one_survivor = 0;
end

end