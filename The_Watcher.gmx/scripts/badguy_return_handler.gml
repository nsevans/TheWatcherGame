if is_returning == true {

    //Start a countdown to when the NPC can interact again
    if interact_alarm_is_set == false {
        alarm[1] = (4 * room_speed)
        interact_alarm_is_set = true
    }
    
    //Get the x and y position of the last path position
    path_x = path_get_x(path, last_path_position)
    path_y = path_get_y(path, last_path_position)
    
    //If close enough, start the path at the last known path position
    if point_distance(x, y, path_x, path_y) < NPC_PATH_SPEED{
        path_start(path, NPC_PATH_SPEED, path_action_stop, true)
        
        path_position = last_path_position
        x = path_x
        y = path_y
        speed = 0
        is_returning = false
        made_collision = false
        collision_object = ''
        got_path_position = false
    //If not, keep moving towards last position
    }else{
        speed = NPC_PATH_SPEED
        direction = point_direction(x, y, path_x, path_y)
    }
}
