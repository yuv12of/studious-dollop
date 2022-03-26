// @description Startup

// Config Variables
vspd = 2 ; // Vertical Movement speed
hspd = 1 ; // Horizontal Movement speed
vdistnc = 544 - 192; // Vertical Travel distance
hdistnc = 0; // Horizontal Travel distance
startposy = y; // Starting Vertical position
startposx = x; // Starting Horizontal position
is_moving_down = true; // Initial Vertical direction
is_moving_right = false; // Initial Horizontal direction
delay = 3 * 60; // How many frames to wait between each trip
sleeping = delay; // The remaining frames to sleep in. 

draw_sprite(sTemporaryBlock,0,x,y)

// calc vdest
if is_moving_down then vdest = startposy + vdistnc else vdest = startposy - vdistnc;
// calc hdest
if is_moving_right then hdest = startposx + hdistnc else hdest = startposx - hdistnc;