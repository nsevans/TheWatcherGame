// Check if button is inactive, not in scene and is paused
if global.button_active == false && global.in_scene == false && global.paused == true{

    // Create button to continue tutorial or go to next level    
    button_x = room_width - (sprite_get_width(button_sprite) + 200)
    button_y = room_height - (sprite_get_height(button_sprite))
    if global.tutorial_stage >= array_length_1d(preambles) - 1 {
        //Last preamble of the tutorial
        //Show next level button    
        with(next_level_button){
            x = other.button_x
            y = other.button_y
            depth = -2
        }
        audio_stop_all()
    
    }else {
        //Show continue button
        with(instance_create(button_x, button_y, continue_tutorial_button_obj)){
            depth = -2
        }
    }
    global.button_active = true
}

if global.in_scene == true && global.alarm_is_set == false{
    seconds = alarm_stages[global.tutorial_stage-1]
    if seconds == 0{
        global.paused = true
        global.in_scene = false
        global.alarm_is_set = false
    }else{
        alarm[0] = seconds
        global.alarm_is_set = true
    }
    
}
