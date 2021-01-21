
if global.paused == false {
    path_speed = NPC_PATH_SPEED
    //Check if this sprite instance has been clicked
    if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) {
        self.isDrawn = !self.isDrawn
        
        
        if self.isDrawn {
            //Undraw any other object that is being drawn to the info board
            for (var i=0; i<array_length_1d(level_controller.npcs); i++){
                npc = level_controller.npcs[i]
                if npc.id != id {
                    npc.isDrawn = false
                }
            }
            
            for(var i=0; i<array_length_1d(level_controller.badguys); i++){
                badguy = level_controller.badguys[i]
                if badguy.id != id {
                    badguy.isDrawn = false
                }
            }
        }
    }
    
    if self.isDrawn{
        
        info_board_obj.type = 'NPC'
        info_board_obj.name = name
        info_board_obj.age = age
        info_board_obj.job = job
        info_board_obj.income = income
        info_board_obj.status = status
        info_board_obj.crime = crime
        info_board_obj.coms = com
        info_board_obj.coms_type = com_type
        info_board_obj.coms_friend = com_friend
        
        //Draw rectangle
        if self.isDrawn {
            draw_rectangle(x-4, y-4, x+sprite_get_width(person_sprite)+3, y+sprite_get_height(person_sprite)+3, true)
        }
        
        //Make sure no other object is circled
        for (var i=0; i<array_length_1d(level_controller.npcs); i++){
            npc = level_controller.npcs[i]
            if npc.isDrawn {
                draw_rectangle(npc.x-3, npc.y-3, 
                               npc.x+sprite_get_width(person_sprite)+3, npc.y+sprite_get_height(person_sprite)+3, 
                               true)
            }
            if npc.id != id {
                npc.isDrawn = false
            }
        }
        
        for(var i=0; i<array_length_1d(level_controller.badguys); i++){
            badguy = level_controller.badguys[i]
            if badguy.isDrawn {
                draw_rectangle(badguy.x-3, badguy.y-3, 
                               badguy.x+sprite_get_width(badguy_sprite)+3, badguy.y+sprite_get_height(badguy_sprite)+3, 
                               true)
            }
            if badguy.id != id {
                badguy.isDrawn = false
            }
        }
        
        undraw = true
    }else{
        if undraw{
            info_board_obj.type = ''
            undraw = false
        }
    }
}else{
    path_speed = 0
}
