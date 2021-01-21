//Once the NPC is done interacting with the object, let it return to its last position
with(collider) {
    if is_returning == false{
        if id == instance_find(badguy_obj, 0).id {
            interactions_count += 1
        }
        is_returning = true
    }
}
//The NPC is done interacting, the object can be interacted with again
is_occupied = false
collision_alarm_is_set = false

