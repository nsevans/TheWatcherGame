
draw_self();

draw_set_alpha(1)
draw_set_font(info_font)
draw_set_colour(c_green)

/*
    DISPLAY FOR BAD GUY OBJECTIVES
*/

objective_offset = y+10
objective_tab = tab * 6
draw_set_font(title_font)

if(is_disrupted == true){
    draw_text(x + x_offset, objective_offset, create_random_text(20))   
}else{
    draw_text(x + x_offset, objective_offset, "Bad Guy's Objectives")
}

draw_set_font(info_font)
draw_text(x + x_offset, objective_offset + 15, sperator_string)

objective_max_width = sprite_get_width(info_board_sprite) - sprite_get_width(objective_sprite) - (tab*2) - x_offset

//Draw objective 1
obj_1_text = objectives[0]
if(is_disrupted == true){
    if(global.paused == false){    
        obj_1_text = create_random_text(8)
    }else{
        obj_1_text = "********"
    }
}
draw_text_ext(x + x_offset + objective_tab, objective_offset + 30,  obj_1_text, 20, objective_max_width)

if (is_disrupted == true){
    obj_sprite_rand = choose(done_sprite, objective_sprite)
    draw_sprite(obj_sprite_rand, 0, x + x_offset + (tab/2), objective_offset + 30)
}else if obj_1_done == true {
    draw_sprite(done_sprite, 0, x + x_offset + (tab/2), objective_offset + 30)
}else{
    draw_sprite(objective_sprite, 0, x + x_offset + (tab/2), objective_offset + 30)
}

//Draw objective 2
obj_2_text = objectives[1]
if(is_disrupted == true){
    if(global.paused == false){    
        obj_2_text = create_random_text(8)
    }else{
        obj_2_text = "********"
    }
}
draw_text_ext(x + x_offset + objective_tab, objective_offset + 80,  obj_2_text, 20, objective_max_width)

if (is_disrupted == true){
    obj_sprite_rand = choose(done_sprite, objective_sprite)
    draw_sprite(obj_sprite_rand, 0, x + x_offset + (tab/2), objective_offset + 80)
}else if obj_2_done == true {
    draw_sprite(done_sprite, 0, x + x_offset + (tab/2), objective_offset + 80)
}else{
    draw_sprite(objective_sprite, 0, x + x_offset + (tab/2), objective_offset + 80)
}

//Draw objective 3
obj_3_text = objectives[2]
if(is_disrupted == true){
    if(global.paused == false){    
        obj_3_text = create_random_text(8)
    }else{
        obj_3_text = "********"
    }
}
draw_text_ext(x + x_offset + objective_tab, objective_offset + 130, obj_3_text, 20, objective_max_width)

if (is_disrupted == true){
    obj_sprite_rand = choose(done_sprite, objective_sprite)
    draw_sprite(obj_sprite_rand, 0, x + x_offset + (tab/2), objective_offset + 130)
}else if obj_3_done == true {
    draw_sprite(done_sprite, 0, x + x_offset + (tab/2), objective_offset + 130)
}else{
    draw_sprite(objective_sprite, 0, x + x_offset + (tab/2), objective_offset + 130)
} 
/*
    DISPLAY FOR INFORMATION ON NPCS OR OBJECTS
*/
observ_offset = y + 220

draw_set_font(title_font)
if (is_disrupted == true){
    draw_text(x + x_offset, observ_offset, create_random_text(19) )
}else{
    draw_text(x + x_offset, observ_offset, "Currently Observing")
}

draw_set_font(info_font)
draw_text(x + x_offset, observ_offset + 15, sperator_string)

//Display NPC Details
if(type == 'NPC' || type == 'OBJ_NPC'){
    
    //DISPLAY NAME AND AGE
    if(is_disrupted == true){
        name_out = ''
        age_out = ''
        if(global.paused == false){    
            name_out = create_random_text(8)
            age_out = create_random_text(2)
        }else{
            name_out = "********"
            age_out = "**"
        }
        draw_text(x + x_offset + tab, observ_offset + 30,  create_random_text(4)+": "+name_out)
        draw_text(x + x_offset + tab, observ_offset + 60,  create_random_text(3)+": "+string(age_out))
    }else{
        draw_text(x + x_offset + tab, observ_offset + 30,  "Name: "+name)
        draw_text(x + x_offset + tab, observ_offset + 60,  "Age: "+string(age))
    }
    
    //DISPLAY JOB AND INCOME
    if(current_level < JOB_UNLOCK_LEVEL || is_disrupted == true) {
        job_out = ''
        income_out = ''
        if global.paused == false{
            job_out = create_random_text(8)
            income_out = create_random_text(8)
        }else{
            job_out = "********"
            income_out = "********"
        }
        draw_text(x + x_offset + tab, observ_offset + 90,  create_random_text(3)+": "+job_out)
        draw_text(x + x_offset + tab, observ_offset + 120, create_random_text(6)+": "+string(income_out))
    }else{
        draw_text(x + x_offset + tab, observ_offset + 90,  "Job: "+job)
        draw_text(x + x_offset + tab, observ_offset + 120, "Income: "+string(income))
    }
    
    
    //DISPLAY RELATIONSHIP STATUS
    if(current_level < STATUS_UNLOCK_LEVEL || is_disrupted == true) {
        status_out = ''
        if global.paused == false{
            status_out = create_random_text(8)
        }else {
            status_out = "********"
        }
        draw_text(x + x_offset + tab, observ_offset + 150, create_random_text(11)+": "+status_out)
    }else{
        draw_text(x + x_offset + tab, observ_offset + 150, "Rel. Status: "+status)
    }
    
    //DISPLAY CRIME
    if(current_level < CRIME_UNLOCK_LEVEL || is_disrupted == true) {
        crime_out = crime
        if global.paused == false{
            crime_out = create_random_text(8)
        }else {
            crime_out = "********"
        }
        draw_text_ext(x + x_offset + tab, observ_offset + 180, create_random_text(6)+": "+crime_out, 20, max_width)
    }else{
        draw_text_ext(x + x_offset + tab, observ_offset + 180, "Crimes: "+crime, 20, max_width)
    }
}
else if(type =='OBJ'){
    obj_observ_offset = observ_offset + 30
    
    if(is_disrupted == true){
        draw_text(x + x_offset + tab, obj_observ_offset, create_random_text(6))
    }else{
        draw_text(x + x_offset + tab, obj_observ_offset, object)
    }
    obj_observ_offset += 30
    
    if transactions != ''{
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(12)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Total Trans.: "+string(transactions))
        }
        obj_observ_offset += 30
    }
    if total_cash != ''{
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(10)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Total Cash: " +string(total_cash))
        }
        obj_observ_offset += 30
    }
    if owner != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(5)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Owner: "+owner)
        }
        obj_observ_offset += 30
    }
    if rent_fee != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(8)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Rent Fee: "+string(rent_fee))
        }
        obj_observ_offset+= 30
    }
    if cpu_cores != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(3)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "CPU: "+string(cpu_cores))
        }
        obj_observ_offset+= 30
    }
    if ram_amount != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(3)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "RAM: "+string(ram_amount))
        }
        obj_observ_offset+= 30
    }
    if storage != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(7)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Storage: "+string(storage))
        }
        obj_observ_offset+= 30
    }
    if internet != '' {
        if(is_disrupted == true){
            draw_text(x + x_offset + tab, obj_observ_offset,  create_random_text(10)+": "+create_random_text(3))
        }else{
            draw_text(x + x_offset + tab, obj_observ_offset,  "Connection: "+string(internet))
        }
        obj_observ_offset+= 30
    }
}else{
    if(is_disrupted == false){
        //Display nothing
        draw_set_font(title_font)
        draw_text(x + x_offset + tab, observ_offset + 30, "N/A")
    }
}

/*
    DISPLAY FOR COMMUNICATIONS
*/

chat_offset = y + 460

coms_type = string_upper(coms_type)
if(type != 'NPC' && type != 'OBJ_NPC') {
    coms_type = 'N/A'
}

draw_set_font(title_font)
if(is_disrupted == true){
    draw_text(x + x_offset, chat_offset, create_random_text(12))
}else{    
    draw_text(x + x_offset, chat_offset, "Chat - "+coms_type)
}

draw_set_font(info_font)
draw_text(x + x_offset, chat_offset + 15, sperator_string)

if(type == 'NPC' || type == 'OBJ_NPC') {

    r = coms_friend
    split_name = split_string(name, ' ')
    s = split_name[0]
    
    if(current_level < CHAT_UNLOCK_LEVEL  || is_disrupted == true){
        if global.paused == false{
            r = create_random_text(4)
            s = create_random_text(4)
        }else{
            r = "****"
            s = "****"
        }
    }
    
    // If last level, switch sender and receiver texts
    if get_current_level_number() == 6 && name == "Nick E."{
        temp = s
        s = r
        r = temp
    }
    
    cur_offset = 30
    
    for(var i=0; i<array_length_1d(coms); i++){
    
        
        if(current_level < CHAT_UNLOCK_LEVEL || is_disrupted == true){
            if global.paused == false{
                coms[i] = create_random_text(12)    
            }else{
                coms[i] = "************"
            }
        }
        str_width = 0
        
        if (i % 2 == 0){
            str_width = string_width("["+s+"]> "+coms[i])
            draw_text_ext(x + x_offset + tab, chat_offset + cur_offset, "["+s+"]> "+coms[i], 20, objective_max_width)
            
        }else {
            str_width = string_width("["+r+"]> "+coms[i])
            draw_text_ext(x + x_offset + tab, chat_offset + cur_offset, "["+r+"]> "+coms[i], 20, objective_max_width)
        }
        //Calculate how many lines this string took up, so the next string doesn't overlap with this one
        num_lines = 1
        if str_width > objective_max_width {
            num_lines = ceil(str_width / objective_max_width)
        }
        
        cur_offset += (num_lines*20) + 10
    }
}else{
    if(is_disrupted == false){
        draw_set_font(title_font)
        draw_text(x + x_offset, chat_offset + 30, "N/A")
    }
}

/*
    DISPLAY CATCH BUTTON
*/
//If the clicked object is an NPC, then display the catch button
if(type == "NPC" || type == 'OBJ_NPC'){
    if get_current_level_number() != 0{
        if accuse_button_active == false {
            instance_activate_object(game_button_obj)
            game_button_obj.depth = -1
            accuse_button_active = true
        }
    }
}else if ((type != "NPC" || type == 'OBJ_NPC')&& accuse_button_active == true){
    instance_deactivate_object(game_button_obj)
    accuse_button_active = false
}

