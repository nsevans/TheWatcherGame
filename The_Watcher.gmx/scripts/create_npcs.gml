/* Generates the details of  and spawns each NPC and badguy in a level
 * @param argument0 - Number of NPCs in a scene
 * @param argument1 - Number of badguys in a scene
 */

randomize()   //Set the see to a random value so random numbers are actually random

//The current level being played
current_level = get_current_level_number()
// Number of NPCs for this level
num_npcs = argument0
// Number of badguys for this level
num_bad = argument1

// Load all possible attributes for NPCs
var names = load_data_from_file("npc_names.txt")
var jobs = load_data_from_file("npc_jobs.txt")
var statuses = load_data_from_file("npc_statuses.txt")
var coms = load_data_from_file("npc_communications.txt")
var bad_coms = load_data_from_file("badguy_communications.txt")
var crimes = load_data_from_file("npc_crimes.txt")
var badguy_stats = load_data_from_file("badguy_stats.txt")

global.npcs = ds_list_create()

npc_john_created = false

// Create each NPC and spawn it into the map
for (i=0; i<num_npcs; i+=1){
    
    if current_level == 0 || current_level == 99{ //Need number in level name, so main menu has 99
        new_npc = instance_create(0,0,tutorial_npc_obj)
    }else if current_level == 6 && npc_john_created == false{
        // Create required NPC for last level
        new_npc = instance_create(0,0,npc_obj)
        new_npc.name = "John R."
        new_npc.age = 37
        new_npc.job = "Manager"
        new_npc.income = "$83000"
        new_npc.status = "Married"
        new_npc.com = split_string(bad_coms[current_level], ';')
        new_npc.com_type = "Text"
        new_npc.com_friend = "Nick"
        new_npc.crime = "N/A"
        new_npc.path = level_6_john_path
        npc_john_created = true
        continue
    }else{
        new_npc = instance_create(0,0,npc_obj)
    }
    new_npc.level = current_level
    new_npc.path_num = i+1
    
    // Set all NPC attributes
    
    // Make sure NPC's name isn't the same as the 
    // badguy's name for the current level
    
    bg_first = 'R'
    if num_bad != 0 {
        badguy = split_string(badguy_stats[current_level], ';')
        bg_first = split_string(badguy[0], ' ')
    }
        
    first_name = names[random(array_length_1d(names))]
    if bg_first != 'R'{
        while(first_name == bg_first){
            first_name = names[random(array_length_1d(names))]
        }
    }
    
    // Make sure no other NPC can be named John on the last level
    if current_level == 6{
        while(first_name == "John"){
            first_name = names[random(array_length_1d(names))]
        }
    }
    
    last_name = chr(irandom_range(ord('A'), ord('Z'))) + '.'
    new_npc.name =  first_name + ' ' + last_name
    
    new_npc.age = irandom_range(19,60)
    
    new_npc.job = jobs[random(array_length_1d(jobs))]
    new_npc.income = "$"+string(irandom_range(10,200) * 1000)
    
    new_npc.status = statuses[random(array_length_1d(statuses))]
    
    new_npc.com = split_string(coms[random(array_length_1d(coms))], ';')
    new_npc.com_type = choose("Text", "Email", "Call")
    //Randomly pick who the NPC is talking to
    new_npc.com_friend = names[random(array_length_1d(names))]
    while(new_npc.com_friend == first_name) {
        new_npc.com_friend = names[random(array_length_1d(names))]
    }
    
    crime_chance = random(100)
    if crime_chance > 40{
        new_npc.crime = 'N/A'
    }else {
        new_npc.crime = crimes[random(array_length_1d(crimes))]
    }
    
    with(new_npc) {
        path_i = other.i+1
        if other.current_level != 99{
            path = asset_get_index("level_"+string(other.current_level)+"_path_"+string(path_i))
        }else{
            path = asset_get_index("level_main_path_"+string(path_i))
        }
        if path == -1 {
                path = error_path
            }
        if path_get_closed(path) {
            path_start(path, NPC_PATH_SPEED, path_action_continue, true)
        }else{
            path_start(path, NPC_PATH_SPEED, path_action_stop, true)
        }
    
    }
    
    // Add NPC to list of all current NPCs
    global.npcs = ds_list_add(global.npcs, new_npc)
}



global.badguys = ds_list_create()
// Create each Badguy and spawn it into map
for (i=0; i<num_bad; i+=1){

    if current_level == 0{
        new_bad = instance_create(0,0,tutorial_badguy_obj)
    }else{
        new_bad = instance_create(0,0,badguy_obj)
    }
    new_bad.level = current_level
    
    new_stats = split_string(badguy_stats[current_level], ';')
    // Set all Badguy attributes
    if new_stats[0] != "R"{
        split_name = split_string(new_stats[0],' ')
        first_name = split_name[0]
        last_name = split_name[1]
    }else{
        first_name = names[random(array_length_1d(names))]
        last_name = chr(irandom_range(ord('A'), ord('Z'))) + '.'
    }
    new_bad.name =  first_name + ' ' + last_name
    
    if new_stats[1] != "R" {
        new_bad.age = real(new_stats[1])
    }else{
        new_bad.age = irandom_range(19,60)
    }
    
    if new_stats[2] != "R" {
        new_bad.job = new_stats[2]
    }else{
        new_bad.job = jobs[random(array_length_1d(jobs))]
    }
    
    if new_stats[3] != "R" {
        new_bad.income = "$"+string(new_stats[3])
    }else{
         new_bad.income = "$"+string(irandom_range(10,200) * 1000)
    }
    
    if new_stats[4] != "R" {
        new_bad.status = new_stats[4]
    }else{
        new_bad.status = statuses[random(array_length_1d(statuses))]
    }
    
    if new_stats[5] != "R" {
        new_bad.crime = new_stats[5]
    }else{
        crime_chance = random(100)
        if crime_chance > 10{
            new_bad.crime = 'N/A'
        }else {
            new_bad.crime = crimes[random(array_length_1d(crimes))]
        }
    }
    // set comms for different levels
    
    if current_level == 6{
        new_bad.com_type = "Text"
        new_bad.com_friend = "John"
        new_bad.com = split_string(bad_coms[new_bad.level+1], ';')
    }else{
        new_bad.com = split_string(bad_coms[new_bad.level], ';')
        new_bad.com_type = choose("Text", "Email", "Call")
        //Randomly pick who the bad guy is talking to
        new_bad.com_friend = names[random(array_length_1d(names))]
        while(new_bad.com_friend == first_name) {
            new_bad.com_friend = names[random(array_length_1d(names))]
        }
    }
    
    //new_bad.crime = crimes[random(array_length_1d(crimes))]
    
    with(new_bad){
        path = error_path
        if level == 0 {
            path = choose(level_0_bad_path)
        }else if level == 1 {
            path = choose(level_1_badpath_1)
        }else if level == 2 {
            path = choose(level_2_badpath_1)
        }else if level == 3 {
            path = choose(level_3_badpath_1)
        }else if level == 4 {
            path = choose(level_4_badpath_1)
        }else if level == 5{
            path = choose(level_5_badpath_1)
        }else if level == 6{
            path = choose(level_6_nick_path)
        }
        
        path_start(path, NPC_PATH_SPEED, path_action_stop, true)
    
    }
    
    // Add Badguy to list of all current Badguys
    global.badguys = ds_list_add(global.badguys, new_bad)

}
