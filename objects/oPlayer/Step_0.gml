/// @desc Basic Movement
// Get player inputs

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up) or keyboard_check(ord("W"));

if (key_left) {
	sprite_index = sMetWalkLeft;
}
else if (key_right) {
	sprite_index = sMetWalkRight;
}

// Calculate movement
var _move = key_right - key_left;

if (_move != 0) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oBlock)) and (key_jump) {
	vsp = -jumpsp
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
