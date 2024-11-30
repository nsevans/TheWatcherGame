if global.paused == false{
    if position_meeting(mouse_x, mouse_y, self){
        if mouse_check_button(mb_left){
            image_index = 2    
        }else{
            image_index = 1
        }
    }else{
        image_index = 0    
    }
}
