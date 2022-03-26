/// @description Settings

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
jumpsp = 9;

collidables = [oBlock, oMovingPlatform];

key_down = 0;

image_xscale = 0.5;
image_yscale = 0.5;

global.xstart = xstart;
global.ystart = ystart;

drowning = 0;
if (not audio_is_playing(sndLevelMusic)) {
	audio_play_sound(sndLevelMusic, 100, true);
}
