/// @description Insert description here
// You can write your code in this editor

width = 1025;
height = 575;

op_border = 50;
op_space = 100;

menu_level = 0;
pos = 0;
option = [["Choose Level", "Quit Game"],["0", "Return to Menu"]];

op_length = array_length(option);

audio_play_sound(sndMainMenu,100,true);

// Add the menu ID to the globals
globalvar main_menu_id;
global.main_menu_id = self.id;
