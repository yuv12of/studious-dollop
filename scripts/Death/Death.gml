// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum DEATH_TYPES {
	DEATH_TYPE__DUMMY,
	DEATH_TYPE__SPIKES,
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
	
	instance_destroy(dead);
}