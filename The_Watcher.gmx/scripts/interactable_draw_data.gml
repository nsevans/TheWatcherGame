if global.paused == false {

    self.outline_is_drawn = !self.outline_is_drawn
    
    if self.outline_is_drawn {
        update_outline_position(self.id);
        
        info_board_obj.type = 'OBJ'
        info_board_obj.object = name_object
        
        if name_sprite == "ATM"{
            
            info_board_obj.transactions = transactions
            info_board_obj.total_cash = "$" + string(total_cash)
            
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage = ''
            info_board_obj.internet = ''
        
        }else if name_sprite = "Vending_Machine" || name_sprite == "Cash_Register"{
            
            info_board_obj.transactions = transactions
            info_board_obj.total_cash = "$" + string(total_cash)
            
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage = ''
            info_board_obj.internet = ''
        
        }else if name_sprite == "Locker" {
        
            info_board_obj.owner = owner
            info_board_obj.rent_fee = rent_fee
        
            info_board_obj.transactions = ''
            info_board_obj.total_cash = ''
            info_board_obj.total_cash = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage = ''
            info_board_obj.internet = ''
            
        }else if name_sprite == "npc_static"{
            info_board_obj.type = 'OBJ_NPC'
            info_board_obj.name = npc_static_name
            info_board_obj.age = npc_static_age
            info_board_obj.job = npc_static_job
            info_board_obj.income = npc_static_income
            info_board_obj.status = npc_static_status
            info_board_obj.crime = 'N/A'
            info_board_obj.coms = npc_static_com
            info_board_obj.coms_type = npc_static_type
            info_board_obj.coms_friend = npc_static_friend
            info_board_obj.is_bad = false
        
        }else if name_sprite == "Computer"{
            info_board_obj.name = "Computer"
            info_board_obj.cpu_cores = cpu_cores
            info_board_obj.ram_amount = ram_amount
            info_board_obj.storage = storage
            info_board_obj.internet = internet
            
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.transactions = ''
            info_board_obj.total_cash = ''
             
        }else if name_sprite == "Invis"{
            info_board_obj.object = object_display_name
            
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.transactions = ''
            info_board_obj.total_cash = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage = ''
            info_board_obj.internet = ''
        
        }else{
            info_board_obj.object = name_object
            
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.transactions = ''
            info_board_obj.total_cash = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage = ''
            info_board_obj.internet = ''
        }
        info_is_drawn = true
    } else {
        if info_is_drawn {
            instance_deactivate_object(global.outline)
            info_board_obj.type = ''
            info_board_obj.object = ''
            info_board_obj.last_used = ''
            info_board_obj.total_cash = ''
            info_board_obj.owner = ''
            info_board_obj.rent_fee = ''
            info_board_obj.transactions = ''
            info_board_obj.name = ''
            info_board_obj.age = ''
            info_board_obj.job = ''
            info_board_obj.income = ''
            info_board_obj.status = ''
            info_board_obj.crime = ''
            info_board_obj.coms = ''
            info_board_obj.coms_type = ''
            info_board_obj.coms_friend = ''
            info_board_obj.cpu_cores = ''
            info_board_obj.ram_amount = ''
            info_board_obj.storage_amount = ''
            info_board_obj.internet = ''
            info_board_obj.is_bad = false
            info_is_drawn = false
        }   
    }
}
