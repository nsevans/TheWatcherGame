if stats_set == false{
    name_object = join_strings(split_string(name_sprite, '_'), ' ')
    
    if name_object == "ATM" {
        total_cash = irandom_range(100,1000) * 10
        transactions = irandom_range(10,100)
    }else {
        total_cash = floor(random_range(1,1000)*10)/10
        transactions = irandom_range(1,25)
    }
    var npc_name_list = load_data_from_file("npc_names.txt")
    owner = npc_name_list[random(array_length_1d(npc_name_list))]
    rent_fee = "$" + string(floor(irandom_range(1,5)*10)/10)

    stats_set = true
}

if created == false {
    //Create code that needs to run after Creation code in editor
    object_set_sprite(self, name_sprite + '_sprite')
    created = true
}
