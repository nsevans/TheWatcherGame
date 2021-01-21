if current_level >= DISRUPT_LEVEL && current_level != 6 && global.started == true{
    if is_disrupted == false {
        is_disrupted = true
        alarm[0] = disrupt_length
        disrupt_length = random_range(min_length, max_length)
        
        //Start Sound
        audio_play_sound(disrupt_sound, 1, false)
        track_length = audio_sound_length(disrupt_sound)
        track_position = random_range(0, track_length-alarm[0])
        audio_sound_set_track_position(disrupt_sound, track_position)
        
    }else{
        is_disrupted = false
        alarm[0] = disrupt_delay
        disrupt_delay = random_range(min_delay, max_delay)
        //Stop Sound
        audio_stop_sound(disrupt_sound)
    }
}
