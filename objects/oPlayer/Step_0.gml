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

// Jumping
// Outrule vertical platforms first
if (key_jump) {
	if object_exists(oVerticalPlatform) and place_meeting(x, y + 1 + (oVerticalPlatform.spd * sign(oVerticalPlatform.dest)), oVerticalPlatform) {
		vsp = -jumpsp
	}
	// Not a vertical platform, calculate collision normally
	else if (is_gonna_collide(x, y + 1)) {
		vsp = -jumpsp
	}
}

// Horizontal Collision
if (is_gonna_collide(x + hsp, y)) {
	while (!is_gonna_collide(x + sign(hsp), y)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Vertical Collision
if (is_gonna_collide(x, y + vsp)) {
	while (!is_gonna_collide(x, y +  sign(vsp))) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
