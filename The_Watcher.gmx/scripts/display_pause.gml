if global.paused == true && global.done == false && global.started == true{
    draw_set_alpha(0.55)
    draw_set_colour(c_black)
    draw_rectangle(-1,-1,room_width+1, room_height+1, false)
    
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(game_title_font)
    draw_set_colour(c_white)
    
    str_len = string_height("PAUSED")
    draw_text(room_width/2, (room_height/2)-(str_len/2), "PAUSED")
    
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    
}
