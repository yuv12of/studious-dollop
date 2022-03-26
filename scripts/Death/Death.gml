// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum DEATH_TYPE {
	DUMMY,
	PIT,
	SPIKES,
	LAVA,
	DROWNING,
}

global.deaths = []

function Death(killer, dead, death_type, death_location, death_time){
	death = {
		death_type: death_type,
		killer: killer,
		death_location: death_location,
		death_time: death_time,
	};
	
	array_push(global.deaths, death);
	
	instance_create_depth(dead.x, dead.y, 0, oMet);
	instance_destroy(dead);
}