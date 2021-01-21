current_level = get_current_level_number()

if current_level == 0{
    audio_play_sound(city_ambience_1_sound, 100, true)
    audio_sound_gain(city_ambience_1_sound, 0.8, 0)
    
}else if current_level == 1 {
    audio_play_sound(subway_station_ambience_1_sound, 100, true)
    audio_sound_gain(subway_station_ambience_1_sound, 0.05, 0)
    
}else if current_level == 2 || current_level == 3{
    audio_play_sound(office_ambience_1_sound, 100, true)
    audio_sound_gain(office_ambience_1_sound, 0.5, 0)
    
}else if current_level == 4 || current_level == 5{
    audio_play_sound(city_ambience_1_sound, 100, true)
    audio_sound_gain(city_ambience_1_sound, 0.8, 0)
    
}else if current_level == 6 {
    audio_play_sound(outdoors_ambience_1_sound, 100, true)
    audio_sound_gain(outdoors_ambience_1_sound, 0.65, 0)
}
