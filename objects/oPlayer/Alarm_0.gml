/// @description Insert description here
// You can write your code in this editor
show_debug_message("Drowned at: " + string(x) + ", " + string(y));
location = {
	x: x,
	y: y,
};
Death(instance_place(self.x, self.y - 25, oWater), self, DEATH_TYPE.DROWNING, location, current_time);