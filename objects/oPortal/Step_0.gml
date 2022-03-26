/// @description Insert description here
// You can write your code in this editor
is_finished = true;

for (var i = 0; i < array_length(required_deaths); i++) {
	is_found = false;
	for (var j = 0; j < array_length(global.deaths); j++) {
		if (required_deaths[i] == global.deaths[j].death_type) {
			is_found = true;
		}
	}
	
	if (!is_found) {
		is_finished	= false;
		break;
	}
}

if (is_finished) {
	is_enabled = true;	
	sprite_index = oPortal;
}