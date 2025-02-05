/// @description Insert description here
// You can write your code in this editor

//Default auto stop the Enemy 
function jd_stop_movement(){
	vel_h = 0;
}

function jd_apply_gravity(){
	vel_v += grav;
}

function jd_frame_finalizado(){
	return image_index >= image_number -1;	
}

function jd_mudar_sprite  (_sprite){	
	 if(sprite_index != _sprite){
			sprite_index = _sprite;
			image_index = 0;
		}
}