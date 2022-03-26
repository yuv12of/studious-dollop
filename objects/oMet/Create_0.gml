/// @description When the player dies
// You can write your code in this editor
hsp = 3;
vsp = -4;
grv = 0.3;

image_xscale = instance_find(oPlayer, 0).image_xscale;
image_yscale = oPlayer.player_size;

image_speed = 1;
image_index = 0;
alarm[0] = 100; // Restart after 1 second