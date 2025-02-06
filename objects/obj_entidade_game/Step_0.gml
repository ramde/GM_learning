/// @description Insert description here
// You can write your code in this editor

//Default auto stop the Enemy 
function jd_stop_movement(){
	vel_h = 0;
}

function jd_apply_gravity(grav_nao_padrao = 0){
	
	if grav_nao_padrao != 0	
		vel_v += grav_nao_padrao;
	else vel_v += grav;	
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