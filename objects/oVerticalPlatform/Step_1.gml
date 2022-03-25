// @desc Platform movement yee

current_direction = is_moving_down;
if not sleeping {
	if is_moving_down then {
		// should move down
		var curr_distance = dest - y;
	
		if (spd < curr_distance) {
			y += spd;
		}
		else {
			y = dest;
			is_moving_down = false; 
		}
	}
	else {
		var curr_distance = dest - y;
		if (y - spd > dest) {
			if place_meeting(x,y, oPlayer) then {
				oPlayer.y -= spd + 2;
			}
			y -= spd;
		}
		else {
			if place_meeting(x,y, oPlayer) then {
				oPlayer.y += curr_distance - 2;
			}
			y = dest;
			is_moving_down = true;
		}
	}
	// Whether or not the direction has changed this time
	if current_direction != is_moving_down then {
		dest = startposy
		startposy = y
		
		sleeping = delay;
	}
}
else {
	sleeping--;
}

/**
if object_exists(oPlayer) then {
	if (round(oPlayer.y + (oPlayer.sprite_height/2)) > y) or (oPlayer.key_down) then mask_index = -1;
	else mask_index = sTemporaryBlock;
}
**/