if global.paused == false{
    if position_meeting(mouse_x, mouse_y, self){
        if mouse_check_button(mb_left){
            //Clicked
            image_index = 2
            if button_was_clicked == false{
                audio_play_sound(button_click_sound, 100, false)
                button_was_clicked = true
            }
        }else{
            //Hovering
            image_index = 1
            if button_was_clicked == true {
                audio_play_sound(button_unclick_sound, 100, false)
                button_was_clicked = false
            }
        }
    }else{
        //No Interacting
        image_index = 0
        button_was_clicked = false
    }
}

