step_counter = 0
gain = 0.05
audio_sound_gain(footstep_1, gain, 0)
audio_sound_gain(footstep_2, gain, 0)
audio_sound_gain(footstep_3, gain, 0)

pitch = random_range(0.9,1.1)
audio_sound_pitch(footstep_1, gain)
audio_sound_pitch(footstep_2, gain)
audio_sound_pitch(footstep_3, gain)

footstep_audio = choose(footstep_1, footstep_2, footstep_3)
audio_play_sound(footstep_audio, 1, false)

sound_playing = false
