if global.paused == true && global.started == false {
    depth = -2
    draw_set_alpha(0.9)
    draw_set_colour(c_black)
    draw_rectangle(-1,-1,room_width+1, room_height+1, false)
    
    draw_set_alpha(1)
    draw_set_colour(c_white)
    draw_set_font(game_title_font)
    
    draw_set_halign(fa_center)
    draw_text((room_width/2), title_offset_y, title)
    
    
    draw_set_halign(fa_left)
    draw_set_font(title_font)
    draw_text_ext(preamble_offset_x, preamble_offset_y, preamble, preamble_sep, preamble_line_len)
    
    if(start_button_created == false){
        button_x = room_width - (sprite_get_width(button_sprite) + 50)
        button_y = room_height - (sprite_get_height(button_sprite) + 50)
        instance_create(button_x, button_y, start_game_button_obj)
        start_game_button_obj.depth = -4
        start_button_created = true
    }
}else{
    depth = 1
}
