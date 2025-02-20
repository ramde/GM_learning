// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script1(){

}

//randomize();
global.transiction_running = true;

//PV
global.max_pv = 2;
global.pv = global.max_pv;

//
instance_create_depth(0, 0, 0, obj_game_control);

function jd_g_mudar_sprite  (_sprite){	
	image_speed = 1;
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		image_index = 0;
	}
}