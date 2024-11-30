if created == false {
    //Create code that needs to run after Creation code in editor
    //Change the sprite of the object
    sprite_index = asset_get_index(name_sprite + '_sprite')
    
    //Set the stats of the object
    name_object = join_strings(split_string(name_sprite, '_'), ' ')
    with(col_box_obj) {
        name_object = other.name_object
        new_angle = other.image_angle
    }
    
    if name_object == "ATM" {
        total_cash = irandom_range(100,1000) * 10
        transactions = irandom_range(10,100)
        
    }else if name_object == 'npc static'{
        //Create NPC with random stats
        var names = load_data_from_file("npc_names.txt")
        var jobs = load_data_from_file("npc_jobs.txt")
        var statuses = load_data_from_file("npc_statuses.txt")
        var coms = load_data_from_file("npc_communications.txt")
        npc_static_first_name = names[random(array_length_1d(names))]
        npc_static_name = npc_static_first_name + " " + chr(irandom_range(ord('A'), ord('Z'))) +'.'
        npc_static_age = irandom_range(19, 60)
        npc_static_job = jobs[random(array_length_1d(jobs))]
        npc_static_income = "$"+string(irandom_range(10,200) * 1000)
        npc_static_status = statuses[random(array_length_1d(statuses))]
        npc_static_com = split_string(coms[random(array_length_1d(coms))], ';')
        npc_static_type = choose("Text", "Email", "Call")
        npc_static_friend = names[random(array_length_1d(names))]
        while(npc_static_friend == npc_static_first_name) {
            npc_static_friend = names[random(array_length_1d(names))]
        }
        npc_static_crime = 'N/A'
        
        sprite_index = npc_static_sprite
        image_index = irandom(image_number-1)
        image_speed = 0
        
    }else if name_object == 'Locker' {
        var npc_name_list = load_data_from_file("npc_names.txt")
        rent_fee = "$" + string(floor(irandom_range(1,5)*10)/10)
        owner = npc_name_list[random(array_length_1d(npc_name_list))]
    }else if name_object = "Computer"{
        cpu_cores = string(choose(4,8,16)) + " Cores"
        ram_amount = string(choose(16,32,64)) + "GB"
        storage = choose(250,500,1000,2000,3000)
        if storage >= 1000 {
            storage = string(storage/1000) + "TB"
        }else{
            storage = string(storage)+"GB"
        }
        internet = choose("Wireless","Wired")
    
    }else{
        total_cash = floor(random_range(1,1000)*10)/10
        transactions = irandom_range(1,25)
    }

    outline_is_updated = true
    
    created = true
}
