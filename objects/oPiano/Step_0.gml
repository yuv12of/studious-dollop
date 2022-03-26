/// @description Insert description here
// You can write your code in this editor
// Calculate movement

vsp = vsp + grv;

function is_gonna_collide(posx, posy) {
	for (i = 0; i < array_length(collidables); i++) {
		if place_meeting(posx,posy,collidables[i]) {
			return true;
		}
	}
	return false;
}

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