/// @description Respawn player
// You can write your code in this editor

player = instance_create_depth(global.xstart, global.ystart, 0, oPlayer);
player.image_xscale = 0.5;
player.image_yscale = 0.5;
instance_destroy(self);