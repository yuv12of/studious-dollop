/// @description Player hits spikes
// You can write your code in this editor

location = {
	x: other.x,
	y: other.y,
};
Death(self, other, DEATH_TYPE.LAVA, location, current_time);