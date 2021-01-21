if global.button_active == true {
    global.tutorial_stage += 1
    global.paused = false
    global.in_scene = true
    global.button_active = false
    instance_deactivate_object(self)
}
