/// @description Insert description here
// You can write your code in this editor

//Default auto stop the Enemy 
function c_event_to_stop(){
	if (vel_h != 0){
		vel_h = 0;
		sprite_index = spr_enemy_pig_idle;
	}
}

function c_apply_gravity(){
	vel_v += grav;
}