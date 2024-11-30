//Only perform the collision action if the collider is empty, the NPC
//can interact and the NPC is no longer returning to their last position
if is_occupied == false && other.can_interact == true && other.is_returning == false{
    
    if name_object == "Bench" {
        new_angle = (new_angle + 180) % 360
    }
    
    sound_gain = 0.4
    if(name_object == 'Vending Machine') {
        sound_gain = 0.2
    }
    if(name_object == 'Locker') {
        sound_gain = 0.25
    }
    if(name_object == "Cash Register"){
        sound_gain = 0.5
    }
    if (name_object == "Computer"){
        sound_gain = 0.1
    }
    sound_asset = asset_get_index(string_replace(name_object, ' ', '_')+'_sound')
    audio_play_sound(sound_asset, 100, false)
    audio_sound_gain(sound_asset, sound_gain, 0)

    //This object is now occupised so no other NPC can enter
    is_occupied = true
    
    //Store colliding objects ID
    collider = other
    //Send this objects ID to colliding object
    other.collision_object = self
    //This NPC is currently colliding with something
    other.made_collision = true
    //This NPC can't interact with a new object
    other.can_interact = false
    //Keep the NPC at the object for a random time between 2 and 5 secconds
    if collision_alarm_is_set == false{
        alarm[0] = random_range(2,5) * room_speed
        collision_alarm_is_set = true
    }
}
