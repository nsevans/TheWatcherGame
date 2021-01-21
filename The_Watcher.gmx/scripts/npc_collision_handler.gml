
if made_collision == true && is_returning == false {
    // Save the last known path position and end the current path    
    if (got_path_position == false){
        last_path_position = path_position
        path_end()
        got_path_position = true
    }
    
    //Get the new position and rotation values for  the Badguy
    new_x = collision_object.x - collision_object.sprite_width/2
    new_y = collision_object.y - collision_object.sprite_height/2
    new_angle = (collision_object.new_angle + 180) % 360
    
    if collision_object.image_angle == 0{
        new_x = collision_object.x + collision_object.sprite_width / 2
        new_y = collision_object.y + collision_object.sprite_height / 2
            
    } else if collision_object.image_angle == 90 {
        new_x = collision_object.x + collision_object.sprite_height / 2
        new_y = collision_object.y - collision_object.sprite_width / 2
        
    }else if other.image_angle == 180 {
        new_x = collision_object.x - collision_object.sprite_width / 2
        new_y = collision_object.y + collision_object.sprite_height / 2
        
    }else if other.image_angle == 270{
        new_x = collision_object.x - collision_object.sprite_height / 2
        new_y = collision_object.y + collision_object.sprite_width / 2
        
    }   
    //Set the new position, speed and rotation values for the Badguy
    x = new_x
    y = new_y
    speed = 0
    image_angle = new_angle
}
