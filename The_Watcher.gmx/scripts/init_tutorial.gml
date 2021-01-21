global.paused = true
global.started = false

report_button_drawn = false

current_level = get_current_level_number()
preambles = load_data_from_file("tutorial_preambles.txt")

badguy_stats = load_data_from_file("badguy_stats.txt")
badguy_stats = split_string(badguy_stats[0], ';')

global.npcs_clicked = 0 //Added so game doesn't break in tutorial when player clicks an NPC

title_offset_y = 50

orig_preamble_offset_x = 100
preamble_offset_x = 100
preamble_offset_y = 150
preamble_sep = 30

reg_line_len = room_width-(preamble_offset_x*2)
stage_2_line_len = (reg_line_len/4) * 3
preamble_line_len = reg_line_len


title = "TUTORIAL LEVEL - "+string(current_level)
str_len = string_width(title)

global.tutorial_stage = 0   //Current stage of tutorial, also index for preamble
global.in_scene = false     //False if showing information to player, true if showing room and actions to player

global.button_active = false

global.alarm_is_set = false

room_speed = 30

global.outline = instance_create(0,0,outline_obj)
instance_deactivate_object(global.outline)

//Alarm timer for each stage of the tutorial (in seconds)
alarm_stages[0] = 0
alarm_stages[1] = 0
alarm_stages[2] = 0
alarm_stages[3] = -1
alarm_stages[4] = 0


next_level_button = instance_create(-1000, -1000, next_level_button_obj)
instance_create(880, 736, tutorial_report_button)
instance_deactivate_object(tutorial_report_button)
