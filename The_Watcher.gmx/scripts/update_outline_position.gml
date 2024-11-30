/* Sets all interactable objects isDrawn parameter to false except for the passed in ID
 * @param arg0 - ID of object not being changed
 */

obj_id = argument0
 
//Make sure no other npc is circled
for (var i=0; i<instance_number(npc_obj); i++){
    npc = instance_find(npc_obj, i)
    if npc.outline_is_drawn == true && npc.id != obj_id {
        npc.outline_is_drawn = false
    }
}

//Make sure no other tutorial npc is circled
for (var i=0; i<instance_number(tutorial_npc_obj); i++){
    npc = instance_find(tutorial_npc_obj, i)
    if npc.outline_is_drawn == true && npc.id != obj_id {
        npc.outline_is_drawn = false
    }
}

//Make sure no other badguy is circled
for(var i=0; i<instance_number(badguy_obj); i++){
    badguy = instance_find(badguy_obj, i)
    if badguy.outline_is_drawn == true && badguy.id != obj_id {
        badguy.outline_is_drawn = false
    
    }
}

//Make sure no other tutorial badguy is circled
for(var i=0; i<instance_number(tutorial_badguy_obj); i++){
    badguy = instance_find(tutorial_badguy_obj, i)
    if badguy.outline_is_drawn == true && badguy.id != obj_id {
        badguy.outline_is_drawn = false
    
    }
}

//Make sure no other object is circled
for(var i=0; i<instance_number(interactive_obj); i++){
    interactable = instance_find(interactive_obj, i)
    if interactable.outline_is_drawn == true && interactable.id != obj_id {
        interactable.outline_is_drawn = false
    }
}
