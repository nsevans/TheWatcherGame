switch(action) {
    case 0:
        room_goto(level_0);
        break;
    case 1:
        room_goto(credits_room);
        break;
    case 2:
        game_end();
        break;
    case 3:
        room_goto(intro_room_99);
        break;
    case 5:
        room_goto(tutorial_level);
        break;
}
