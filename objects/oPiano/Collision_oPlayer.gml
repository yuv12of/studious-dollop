/// @description Insert description here
// You can write your code in this editor

if (!has_killed) {
	location = {
		x: other.x,
		y: other.y,
	};
	Death(self, other, DEATH_TYPE.PIANO, location, current_time);

	//alarm[0] = 60;
	has_killed = true;
}