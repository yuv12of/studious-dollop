//get inputs

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

// store number of options in the current menu
op_length = array_length(option[menu_level]);

// move through the menu
pos += down_key - up_key;
if pos >= op_length then pos = 0;
if pos < 0 then pos = op_length - 1;

// using the options
if accept_key {
	var _sml = menu_level;
	
	switch (menu_level) {
	// Main menu
	case 0:
		switch (pos) {
		// level selector
		case 0:
			menu_level = 1;
			break;
		// quit
		case 1:
			game_end();
			break;
		}
		break;
	// Levels menu
	case 1:
		switch (pos) {
		// Return to Menu
		case 2:
			menu_level = 0;
			break;
		// Supposedly a level
		default:
			var i = 0
			while (room_exists(i)) {
				show_debug_message("Level" + option[menu_level, pos]);
				if (room_get_name(i) == "Level" + option[menu_level, pos]) {
					show_debug_message("Going to into Level" + option[menu_level, pos] + ", AKA room #"+string(i));
					room_goto(i);
				}
				
				i++;
			}
		}
	}
	
	if _sml != menu_level then pos = 0;
}