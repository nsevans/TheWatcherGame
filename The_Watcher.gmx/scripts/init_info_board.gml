name = ''
age = ''
job = ''
income = ''
status = ''
crime = ''
type = ''   //Distinguish between NPC and OBJs when displaying info, 
            //empty string '' means display nothing
coms = ''
coms_type = ''
coms_friend = ''
is_bad = ''

object = ''
transactions = ''
total_cash = ''
owner = ''
rent_fee = ''

cpu_cores = ''
ram_amount = ''
storage = ''
internet = ''

draw_set_alpha(1)
draw_set_font(info_font)
draw_set_colour(c_white)

sperator_string = "---------------------------"
   
x_offset = 8
tab = 8
end_of_line_buffer = 8
max_line_x = x + x_offset + end_of_line_buffer
max_width = window_get_width() - max_line_x

current_level = get_current_level_number()

instance_create(880, 736, game_button_obj)

instance_deactivate_object(game_button_obj)

accuse_button_active = false

objectives = load_data_from_file("level_objectives.txt")
objectives = split_string(objectives[current_level], ';')

obj_1_done = false
obj_2_done = false
obj_3_done = false

done_char = '- '
done_char_len = string_width(done_char)

is_disrupted = false
min_delay = 20 * room_speed
max_delay = 30 * room_speed
disrupt_delay = random_range(min_delay, max_delay) //Disrupt will happen every 20 to 30 seconds

min_length = 3 * room_speed
max_length = 6 * room_speed
disrupt_length = random_range(min_length, max_length)  //Disrupt will last for only 3 to 6 seconds

alarm[0] = disrupt_delay
