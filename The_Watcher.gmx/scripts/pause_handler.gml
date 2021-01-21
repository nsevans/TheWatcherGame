if keyboard_check_pressed(vk_escape) && global.done == false && global.started = true{
    global.paused = !global.paused
    if global.paused {
        global.paused_start_time = current_time
        audio_pause_all()
    }else{
        audio_resume_all()
        global.time_spent_paused += current_time - global.paused_start_time
    }
}
