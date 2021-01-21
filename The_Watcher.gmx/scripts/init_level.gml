global.npcs_clicked = 0             //Number of NPCs clicked before end of game
global.start_time = current_time    //Time in milliseconds when the level was started
global.time_spent_paused = 0        //Track time spent paused to apply to total level time
global.paused_start_time = 0        //Time when pause started
global.total_time = 0               //Time in seconds it took to complete level
global.done = false                 //Track if level is over
global.accused = false              //Keeps track of accused button press

global.outline = instance_create(-100,-100, outline_obj)
instance_deactivate_object(global.outline)

room_speed = 30
