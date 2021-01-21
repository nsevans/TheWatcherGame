//------------//
// BADGUY INIT
//------------//

/* Flag for running creation code after creation */
created = false

/* Assign a random sprite to the NPC */
image_speed = 0
image_index = irandom(image_number-1)

/* Counter for how often a footstep noise is played */
step_counter = 0

//------------------------------//
//BADGUY INTERACTIONS/COLLISIONS
//------------------------------//

/* Flag for a collision object to set when this badguy collides
   with an object */
made_collision = false

/* Container for storing the ID of the object the badguy collided with */
collision_object = ''

/* Flag for getting the path position and ending the path */
got_path_position = false

/* Flag for when a Badguy can interact with a new object, after having 
   already interacted with an object in a set amount of time */
can_interact = true

/* Flag for when the alarm is started so a Badguy caninteract again */
interact_alarm_is_set = false

/* Counter for each interaction a badguy has */                
interactions_count = 0

/* Flags for keeping track of objectives and setting alarms */
obj_1_alarm_set = false
obj_2_alarm_set = false
obj_3_alarm_set = false

//------------------//
//BADGUY PATHFINDING
//------------------//

/* Used for storing the position on the path (0 to 1) that the Badguy
   was at before interacting with an object */
last_path_position = 0

/* Flag to set when the Badguy is returning to the above position on
   the path */
is_returning = false

//-----------//
//BADGUY INFO
//-----------//

/* Flag for undrawing Badguy info only once */
info_is_drawn = false

//------------------------//
//BADGUY OUTLINE INDICATOR
//------------------------//

/*Flag for if the Badguy has an outline around it */
outline_is_drawn = false

/* Flag for if the outline has been updated to match the Badguy's scale */
outline_is_updated = false
