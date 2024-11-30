
current_level = get_current_level_number()
// Some weird problem where room 2 won't restart, but any other room will
if current_level == 2 {
    
    global.done = false
    global.paused = false
    
    global.npcs_clicked = 0
    global.start_time = current_time
    global.time_spent_paused = 0
    global.paused_start_time = 0
    global.total_time = 0
    global.accused = false
    
    level_2_controller.end_button_created = false
    
    for (var i=0; i<instance_number(collision_box_obj); i++){
        with(instance_find(collision_box_obj, i)){
            alarm[0] = 0
            is_occupied = false
            collision_alarm_is_set = false
        }
    }
    
    for (var i=0; i<instance_number(interactive_obj); i++){
        with(instance_find(interactive_obj, i)){
            outline_is_drawn = false
            info_is_drawn = false
            outline_is_updated = false
            
        }
    }
    
    for (var i=0; i<instance_number(npc_obj); i++){
        with(instance_find(npc_obj, i)){
        
            alarm[1] = -1
            
            created = false
            
            made_collision = false
            collision_object = ''
            got_path_position = false
            can_interact = true
            interact_alarm_is_set = false
            
            last_path_position = 0
            is_returning = false
            info_is_drawn = false
            
            outline_is_drawn = false
            outline_is_updated = false
            
            path_position = 0     
            path_speed = NPC_PATH_SPEED
            
            x = path_get_x(path, 0)
            y = path_get_y(path, 0)
        }
    }
    for (var i=0; i<instance_number(badguy_obj); i++){
        with(instance_find(badguy_obj, i)){
        
            alarm[1] = -1
            alarm[2] = -1
            
            created = false
            
            path_position = 0
            path_speed = NPC_PATH_SPEED
            
            x = path_get_x(path, 0)
            y = path_get_y(path, 0)
            
            made_collision = false
            collision_object = ''
            got_path_position = false
            can_interact = true
            interact_alarm_is_set = false
            
            last_path_position = 0
            is_returning = false
            info_is_drawn = false
            
            outline_is_drawn = false
            outline_is_updated = false
            
            obj_1_alarm_set = false
            obj_2_alarm_set = false
            obj_3_alarm_set = false
            interactions_count = 0
            
        }
    }
    
    with(outline_obj){
        x = -100
        y = -100
    }
    
    with(info_board_obj){
        obj_1_done = false
        obj_2_done = false
        obj_3_done = false
        
        name = ''
        age = ''
        job = ''
        income = ''
        status = ''
        crime = ''
        type = ''
    }
    
    instance_deactivate_object(restart_level_button_obj)

}else{
    room_restart()
}
