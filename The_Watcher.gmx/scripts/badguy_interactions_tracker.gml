// Add delay to objective notification update so the player can't tell exactly
// who completed the action when it was completed
if interactions_count == 1 && obj_1_alarm_set == false{
    alarm[2] = 0.75 * room_speed
    obj_1_alarm_set = true
}
if interactions_count == 2 && obj_2_alarm_set == false {
    alarm[2] = 0.75 * room_speed
    obj_2_alarm_set = true
}
if interactions_count == 3 && obj_3_alarm_set == false{
    alarm[2] = 0.75 * room_speed
    obj_3_alarm_set = true
}

if path_position == 1 && interactions_count >= 3{
    global.done = true
}
