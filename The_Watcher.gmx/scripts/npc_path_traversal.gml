/* Assigns a random path to a single 
 *
 */
with(self) {

    level = argument0
    path_num = irandom_range(1,argument1)
    path_start(level+"_path0"+string(path_num), NPC_PATH_SPEED, path_action_continue, true)
}
