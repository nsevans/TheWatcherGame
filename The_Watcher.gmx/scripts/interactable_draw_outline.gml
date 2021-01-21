draw_self();
//Draw rectangle around object


if self.outline_is_drawn {
    with(global.outline){
        if(other.name_object == "Bench"){
            x = other.bench_x
            y = other.bench_y
        }else{
            x = other.x
            y = other.y
        }
        sprite_index = interactable_outline_sprite
        image_angle = other.image_angle
    }
    instance_activate_object(global.outline)
}
