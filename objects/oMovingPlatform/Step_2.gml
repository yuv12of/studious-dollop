/// @description Platform movement

current_vdirection = is_moving_down;
current_hdirection = is_moving_right;

// Movement
if not sleeping {
	if vdistnc {
		if is_moving_down then {
			// should move down
			var curr_distance = vdest - y;
	
			if (vspd < curr_distance) {
				y += vspd;
			}
			else {
				y = vdest;
				is_moving_down = false; 
			}
		}
		else {
			var curr_distance = vdest - y;
			if (y - vspd > vdest) {
				if place_meeting(x,y, oPlayer) then {
					oPlayer.y -= vspd + 2;
				}
				y -= vspd;
			}
			else {
				if place_meeting(x,y, oPlayer) then {
					oPlayer.y += curr_distance - 2;
				}
				y = vdest;
				is_moving_down = true;
			}
		}
	}
	
	if hdistnc {
		if is_moving_right then {
			// should move right
			var curr_distance = hdest - x;
	
			if (hspd < curr_distance) {
				// Player on me
				if place_meeting(x,y - 1, oPlayer) then {
					oPlayer.x += hspd;
				}
				x += hspd;
			}
			else {
				// Player on me
				if place_meeting(x,y - 1, oPlayer) then {
					oPlayer.x -= curr_distance;
				}
				x = hdest;
				is_moving_right = false; 
			}
		}
		else {
			// should move left
			var curr_distance = hdest - x;
			if (x - hspd > hdest) {
				// Player on me
				if place_meeting(x,y - 1, oPlayer) then {
					oPlayer.x -= hspd;
				}
				x -= hspd;
			}
			else {
				// Player on me
				if place_meeting(x,y - 1, oPlayer) then {
					oPlayer.x += curr_distance;
				}
				x = hdest;
				is_moving_right = true;
			}
		}
	}
	
	// Whether or not the vdirection has changed this time
	if current_vdirection != is_moving_down then {
		vdest = startposy;
		startposy = y;
	}
	// Whether or not the hdirection has changed this time
	if current_hdirection != is_moving_right then {
		hdest = startposx;
		startposx = x;
	}
	
	if (!vdistnc or current_vdirection != is_moving_down) and (!hdistnc or current_hdirection != is_moving_right) {
		sleeping = delay;
	}
	
}
else {
	sleeping--;
}


if object_exists(oPlayer) then {
	if (round(oPlayer.y + (oPlayer.sprite_height/2)) > y) or (oPlayer.key_down) then mask_index = -1;
	else mask_index = sTemporaryBlock;
}
