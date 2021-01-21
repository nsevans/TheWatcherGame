draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(game_title_font);
draw_set_colour(c_white);

str_len = string_width(title_text);
old_sprite_width = sprite_get_width(title_sprite)

new_sprite_width = (str_len+buffer_width)/old_sprite_width

image_xscale = room_width//new_sprite_width

draw_text(x,y,title_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
