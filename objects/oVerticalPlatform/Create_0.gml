// @description Startup

// Config Variables
spd = 1 ; // Movement speed
distnc = 450; // Travel distance
startposy = y; // Starting position
is_moving_down = false; // Initial direction
delay = 3 * 60; // How many frames to wait between each trip
sleeping = delay; // The remaining frames to sleep in. 

draw_sprite(sTemporaryBlock,0,x,y)

// calc dest
if is_moving_down then dest = startposy + distnc else dest = startposy - distnc;