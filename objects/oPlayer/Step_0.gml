/// @desc Basic Movement
// Get player inputs

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_down =  keyboard_check(vk_down) or keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up) or keyboard_check(ord("W"));

// Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

function is_gonna_collide(posx, posy) {
	for (i = 0; i < array_length(collidables); i++) {
		if place_meeting(posx,posy,collidables[i]) {
			return true;
		}
	}
	return false;
}

#region Player jumping
if (key_jump) {
	// Outrule vertical platforms first
	if object_exists(oMovingPlatform) and place_meeting(x, y + 1 + (oMovingPlatform.vspd * sign(oMovingPlatform.vdest)), oMovingPlatform) {
		vsp = -jumpsp
	}
	// Not a vertical platform, calculate collision normally
	else if (is_gonna_collide(x, y + 1)) {
		vsp = -jumpsp
	}
}
#endregion

#region Horizontal Collision
if (is_gonna_collide(x + hsp, y)) {
	while (!is_gonna_collide(x + sign(hsp), y)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp;
#endregion

#region Vertical Collision
if (is_gonna_collide(x, y + vsp)) {
	while (!is_gonna_collide(x, y +  sign(vsp))) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
#endregion

// Animation

/* Jumping */
if (vsp != 0) {
	is_vsp = true;
	if (sprite_index == sMetJump) {
		if (image_index == 4) {
			image_speed = 0;
			image_index = 4;
		} else {
			image_speed = 1;
		}
	} else {
		sprite_index = sMetJump;
		image_speed = 1;
		image_index = 0;
	}
/* Walking */
} else if (hsp != 0) {
	if (!is_vsp) {
		if (sprite_index != sMetWalk) {
			sprite_index = sMetWalk;
		}
		image_speed = 1;
	}
	is_vsp = false;
/* Stationary */
} else {
	if (!is_vsp) {
		image_speed = 0;
		image_index = 0;
	}
	is_vsp = false;
}

/* If going the opposite way, flip image. */
if (hsp != 0) image_xscale = 0.5 * sign(hsp);

/* Pit death */
if (view_get_hport(0) < self.y) {
	location = {
		x: self.x,
		y: self.y,
	}
	Death(room, self, DEATH_TYPE.PIT, location, current_time);
}

/* Drowning */
if (position_meeting(x, y - 25, oWater)) {
	if (!drowning) {
		drowning = true;
		alarm[0] = room_speed * 3;
	}
} else {
	drowning = false;
	alarm[0] = -1;
}

	