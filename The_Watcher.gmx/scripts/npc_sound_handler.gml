if global.paused == false{
    if made_collision == false{
        step_counter += 1
        
       random_offset = random_range(-room_speed/4,room_speed/4)
       
        if (step_counter >= room_speed + random_offset) {
            step_counter = 0
            gain = 0 //TEMP gain = 0.5
            audio_sound_gain(footstep_1, gain, 0)
            audio_sound_gain(footstep_2, gain, 0)
            audio_sound_gain(footstep_3, gain, 0)
            
            pitch = random_range(0.9,1.1)
            audio_sound_pitch(footstep_1, gain)
            audio_sound_pitch(footstep_2, gain)
            audio_sound_pitch(footstep_3, gain)
            
            footstep_audio = choose(footstep_1, footstep_2, footstep_3)
            audio_play_sound(footstep_audio, 1, false)
        }
    }
}
