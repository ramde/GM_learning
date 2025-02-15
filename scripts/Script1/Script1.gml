// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script1(){

}

//randomize();
global.transiction_running = true;

function jd_g_mudar_sprite  (_sprite){	
	image_speed = 1;
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;
	}
}