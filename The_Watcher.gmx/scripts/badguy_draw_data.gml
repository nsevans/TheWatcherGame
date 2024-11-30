if global.paused == false{
    self.outline_is_drawn = !self.outline_is_drawn
    
    if self.outline_is_drawn{
        
        update_outline_position(self.id)
        
        info_board_obj.type = 'NPC'
        info_board_obj.name = name
        info_board_obj.age = age
        info_board_obj.job = job
        info_board_obj.income = income
        info_board_obj.status = status
        info_board_obj.crime = crime
        info_board_obj.coms = com
        info_board_obj.coms_type = com_type
        info_board_obj.coms_friend = com_friend
        info_board_obj.is_bad = true
        
        info_is_drawn = true
    }else{
        if info_is_drawn{
            instance_deactivate_object(global.outline)
            info_board_obj.type = ''
            info_board_obj.name = ''
            info_board_obj.age = ''
            info_board_obj.job = ''
            info_board_obj.income = ''
            info_board_obj.status = ''
            info_board_obj.crime = ''
            info_board_obj.coms = ''
            info_board_obj.coms_type = ''
            info_board_obj.coms_friend = ''
            info_board_obj.is_bad = ''
            info_is_drawn = false
        }
        
        
        
    }
}
