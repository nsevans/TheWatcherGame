
if info_board_obj.is_bad == true{
    //next stage
    global.tutorial_stage += 1
    global.in_scene = false
    global.paused = true
    global.alarm_is_set = false
    instance_deactivate_object(self)
}else{
    audio_play_sound(wrong_sound,100,false)
}
