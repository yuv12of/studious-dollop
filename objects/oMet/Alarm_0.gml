/// @description Respawn player
// You can write your code in this editor

instance_create_depth(global.xstart, global.ystart, 0, oPlayer);
instance_destroy(self);