global.paused = true
global.started = false

current_level = get_current_level_number()
preambles = load_data_from_file("level_preambles.txt")
preamble = preambles[current_level-1]

title_offset_y = 50

preamble_offset_x = 100
preamble_offset_y = 150
preamble_sep = 35
preamble_line_len = room_width-(preamble_offset_x*2)

title = "LEVEL - "+string(current_level)
str_len = string_width(title)

start_button_created = false
