if created == false {
    path_start(path, NPC_PATH_SPEED, path_action_continue, true)
    x = path_get_x(path, 0)
    y = path_get_y(path, 0)
    xprevious = x
    yprevious = y
    
    created = true
}
