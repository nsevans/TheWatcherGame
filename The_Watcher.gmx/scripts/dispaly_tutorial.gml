

// Check if player should be playing (in_scene)
if global.tutorial_stage == 4{
    global.in_scene = true
}else{
    global.in_scene = false
}

if global.in_scene == false{
    current_preamble = preambles[global.tutorial_stage]
    
    depth = -1
    draw_set_alpha(0.9)
    draw_set_colour(c_black)
    
    if global.tutorial_stage == 0 || global.tutorial_stage == 5{
        // Draw box over entire scene
        draw_rectangle(-1,-1,room_width+1, room_height+1, false)
    
    }else if global.tutorial_stage == 1{
        // Draw box over right section of scene
        draw_rectangle(room_width - sprite_get_width(info_board_sprite), -1, room_width+1, room_height+1, false)
    
    }else if global.tutorial_stage == 2{
        // Draw box over left side of scene
        draw_rectangle(-1, -1, room_width - sprite_get_width(info_board_sprite), room_height+1, false)
        
        // Show NPC Data
        with(instance_find(tutorial_badguy_obj, 0)){
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
            info_board_obj.is_bad = true    
        }
        
    }else if global.tutorial_stage == 3{
        //Draw box over entire scene
        draw_rectangle(-1,-1,room_width+1, room_height+1, false)
        
        //Hide NPC Data
        info_board_obj.type = ''
        info_board_obj.name = ''
        info_board_obj.age = ''
        info_board_obj.job = ''
        info_board_obj.income = ''
        info_board_obj.status = ''
        info_board_obj.crime = ''
        info_board_obj.coms = ''
        info_board_obj.coms_type = ''
        info_board_obj.coms_friend = ''
        info_board_obj.is_bad = false
    }
    
    // Draw current preamble
    draw_set_alpha(1)
    draw_set_colour(c_white)
    draw_set_font(game_title_font)
    
    // Draw title
    // Change title colour for contrast in scene 1
    if global.tutorial_stage == 1 {
        draw_set_colour(c_black)    
    }
    draw_text((room_width/2) - str_len, title_offset_y, title)
    draw_set_colour(c_white)
    
    // Set text line length and start position depending on current scene
    if global.tutorial_stage == 2{
        preamble_line_len = stage_2_line_len
        preamble_offset_x = orig_preamble_offset_x
    }else if global.tutorial_stage == 1 {
        preamble_line_len = sprite_get_width(info_board_sprite) - 8
        preamble_offset_x = info_board_obj.x + 8
    }else{
        preamble_line_len = reg_line_len
        preamble_offset_x = orig_preamble_offset_x
    }
    
    draw_set_font(title_font)
    sub_preambles = split_string(current_preamble, NEW_LINE)
    
    // Draw preamble text
    current_offset = 0
    for(var i=0; i<array_length_1d(sub_preambles); i++){
        draw_text_ext(preamble_offset_x, preamble_offset_y + current_offset, sub_preambles[i], preamble_sep, preamble_line_len)
        
        num_lines = 1
        str_width = string_width(sub_preambles[i])
        if str_width > preamble_line_len {
            num_lines = ceil(str_width / preamble_line_len)
        }
        current_offset += (num_lines * preamble_sep) + preamble_sep;
    }
}else{
    // Activate report button
    if info_board_obj.type == "NPC"{
        instance_activate_object(tutorial_report_button)
    }else{
        instance_deactivate_object(tutorial_report_button)
    }
}


