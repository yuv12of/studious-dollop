/// @desc Basic Movement
// Get player inputs

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up) or keyboard_check(ord("W"));

// Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oBlock)) and (key_jump) {
	vsp = -jumpsp;
}

// Horizontal Collision
if (place_meeting(x + hsp, y, oBlock)) {
	while (!place_meeting(x + sign(hsp), y, oBlock)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, oBlock)) {
	while (!place_meeting(x, y +  sign(vsp), oBlock)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;



// Animation
function is_moving() {
	return (hsp != 0) or (vsp != 0);
}

/* If not jumping or falling */
if (vsp == 0 and hsp != 0 and sprite_index != sMetWalk) {
	sprite_index = sMetWalk;
}

/* If currently jumping - going up */
if (vsp > 0) {
	if (sprite_index != sMetJump) {
		sprite_index = sMetJump;
		image_speed = 1;
		image_index = 0;
	}
}
if (sprite_index == sMetJump and image_index == 5) {
	image_speed = 0;
}

/* If not moving at all, stop animation. */
if (is_moving()) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

/* If going the opposite way, flip image. */
if (hsp != 0) image_xscale = sign(hsp);
