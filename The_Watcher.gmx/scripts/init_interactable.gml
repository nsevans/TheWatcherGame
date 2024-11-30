//-----------------//
//INTERACTABLE INIT
//-----------------//

/* Flag for running creation code after creation */
created = false

//name_sprite = "ATM"

//------------------//
//INTERACTABLE INFO
//-----------------//

/* Flag for undrawing object info only once */
info_is_drawn = false

//------------------------------//
//INTERACTABLE OUTLINE INDICATOR
//------------------------------//

/* Flag for is the npc has an outline around it */
outline_is_drawn = false

/* Flag for if the outline has been updated to match the npc's scale */
outline_is_updated = false

//--------------------------------//
//INTERACTABLE SPAWN COLLISION BOX
//--------------------------------//

cx = 0  //Collision boxs x position
cy = 0  //Collision boxs y position
cw = sprite_get_width(collision_box_sprite)     //Width of collision box
ch = sprite_get_height(collision_box_sprite)    //Height of collision box
if(image_angle == 0) {
    cx = x + cw
    cy = y
}else if(image_angle == 90) {
    cx = x
    cy = y - (ch*2)
}else if(image_angle == 180) {
    cx = x - (cw*2)
    cy = y - ch
}else if(image_angle == 270) {
    cx = x - cw
    cy = y + ch
}
col_box_obj = instance_create(cx,cy,collision_box_obj)
with(col_box_obj){
    interactable_x = other.x
    interactable_y = other.y
}

// Outline position of the bench sprite
bench_x = x
bench_y = y
if image_angle%360 == 0 {
    bench_x = x + (sprite_get_width(Bench_sprite)/2) - 5
    bench_y = y
}else if image_angle%360 == 90 {
    bench_x = x
    bench_y = y - (sprite_get_width(Bench_sprite)/2) + 5
}else if image_angle%360 == 180 {
    bench_x = x - (sprite_get_width(Bench_sprite)/2) + 5
    bench_y = y
}else if image_angle%360 == 270{
    bench_x = x
    bench_y = y + (sprite_get_width(Bench_sprite)/2) - 5
}

depth = 0


