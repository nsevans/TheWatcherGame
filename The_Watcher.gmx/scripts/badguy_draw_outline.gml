draw_self();

//Draw rectangle
if self.outline_is_drawn {
    instance_activate_object(global.outline)
    with(global.outline){
        x = other.x
        y = other.y
        sprite_index = npc_outline_sprite
        image_angle = other.direction
    }
}
