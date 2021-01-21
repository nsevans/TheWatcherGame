if global.done == true{

    audio_stop_all()

    self.depth = -2
    draw_set_alpha(0.85)
    draw_set_colour(c_black)
    draw_rectangle(-1, -1, room_width+1, room_height+1, false)
    
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(game_title_font)
    draw_set_colour(c_white)
    
    title = ''
    str_len = 0
    
    w = sprite_get_width(button_sprite)
    h = sprite_get_height(button_sprite)
    
    if get_current_level_number() == 6 && global.accused == true && (info_board_obj.name == "Nick E." ||  info_board_obj.name == "John R."){
        draw_set_font(title_font)
        if info_board_obj.name == "Nick E."{
            draw_text(room_width/2, room_height/2 - 200, "You got the neighbour.")
            draw_text(room_width/2, room_height/2 - 170, "Was it really the right thing to do though?")
            draw_text(room_width/2, room_height/2 - 140, "He's now in jail for something he didn't do.")
            
            draw_set_font(info_font)
            draw_text(room_width/2, room_height/2 + 350, "Maybe John should be taken out instead.")
            
        }else if info_board_obj.name == "John R." {
            draw_text(room_width/2, room_height/2 - 200, "You got John.")
            draw_text(room_width/2, room_height/2 - 170, "He's been fired for taking advantage of his position.")
        }
        
        button_y = room_height - (sprite_get_height(button_sprite) + 50)
        if(end_button_created == false && get_current_level_number() == 6){
            
            if info_board_obj.name == "Nick E."{
                instance_create(sprite_get_width(button_sprite) + 50, button_y, restart_level_button_obj)
                restart_level_button_obj.depth = -2
            }
            
            with(instance_create(room_width - (sprite_get_width(button_sprite) + 50), button_y, next_level_button_obj)){
                button_text = "Credits"
            }
            next_level_button_obj.depth = -2
            
            end_button_created = true
        }
        
        info_board_obj.is_bad = true
        
        draw_set_font(game_title_font)
    
    }else{
    
        if(info_board_obj.is_bad == true && global.accused == true){
            title = "YOU GOT THEM!"
            str_len = string_width(title)
            
        }else{
            title = "YOU LOSE..."
            str_len = string_width(title)
            
            draw_set_font(title_font)
            if instance_find(badguy_obj, 0).interactions_count >= 3 {
                //Tell player they lost because person got away
                draw_text(room_width/2, room_height/2 - 200, "The badguy got away...")
            }else {
                //Tell player they lost because they picked the wrong person
                draw_text(room_width/2, room_height/2 - 200, "You got the wrong person...")
            }
            draw_set_font(game_title_font)
        }
    }
    
    draw_text(room_width/2, room_height/2 - 100, title)
    
    if captured_time == false {
        total_time = ((current_time - global.start_time) - global.time_spent_paused) / 1000
        captured_time = true
    }
    
    if(info_board_obj.is_bad == true && global.accused == true){
        //Calculate how many stars the player got for the level
        stars = 0
        if global.npcs_clicked <= 4 {
            stars = 2
        }else if global.npcs_clicked <= 8 {
            stars = 1.45
        }else if global.npcs_clicked <= 15 {
            stars = 1
        }else if global.npcs_clicked <= 18 {
            stars = 0.55
        }else if global.npcs_clicked <= 23{
            stars = 0.25
        }else {
            stars = 0
        }
        
        if total_time >= 120 {
            stars -= 1.5
        }else if total_time >= 80 {
            stars -= 1
        }else if total_time >= 45 {
            stars -= 0.5
        }else if total_time >= 20 {
            stars -= 0.35
        }else if total_time >= 10 {
            stars -= 0.15
        }else{
            stars -= 0
        }
        
        if stars < 0 {
            stars = 0
        }
        
        draw_sprite(stars_sprite, round(stars), room_width/2, room_height/2)
        
        draw_set_font(title_font)
        draw_text(room_width/2, room_height/2 + 100, "NPCs Clicked: "+string(global.npcs_clicked))
        
        draw_text(room_width/2, room_height/2 + 200, "Elapsed time: "+string(total_time)+"s")   
        
        //If the player didn't get 3 stars tell them how they can
        if (stars < 2 && current_level != 6) || (current_level == 6 && info_board_obj.name == "John R." && stars < 2){
            draw_set_font(info_font)
            draw_text(room_width/2, room_height/2 + 350, "To earn more stars you've gotta be quicker or click fewer NPCs.")
        }
    }

    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    
    
    button_x = room_width - (sprite_get_width(button_sprite) + 50)
    button_y = room_height - (sprite_get_height(button_sprite) + 50)
    if(info_board_obj.is_bad == true && global.accused == true){
        if(end_button_created == false){
            instance_create(button_x, button_y, next_level_button_obj)
            next_level_button_obj.depth = -2
            end_button_created = true    
        }
    }else{
    
        if(end_button_created == false){
            instance_activate_object(restart_button)
            with(restart_button){
                x = other.button_x
                y = other.button_y
            }
            
            restart_level_button_obj.depth = -2
            end_button_created = true
        }
    }
}
