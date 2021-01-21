draw_set_font(info_font)
draw_set_colour(c_white)

credits = load_data_from_file('credits.txt')

cur_line = -1
cur_subline = -1

for(var line = 0; line < array_length_1d(credits); line++) {
    if(string_char_at(credits[line], 0) == ' '){
        cur_subline += 1
    }else{
        cur_line += 1
    }
    draw_text(x_offset, y_offset + (y_main_spacer * cur_line) + (y_sub_spacer * cur_subline), credits[line])
}
