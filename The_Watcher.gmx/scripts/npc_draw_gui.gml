if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) {
    self.isDrawn = !self.isDrawn
    
    //Make sure no other object is being drawn
    for (var i=0; i<array_length_1d(level_controller.npcs); i++){
        npc = level_controller.npcs[i]
        npc.isDrawn = false
    }
    
    for(var i=0; i<array_length_1d(level_controller.badguys); i++){
        badguy = level_controller.badguys[i]
        badguy.isDrawn = false
    }
}
