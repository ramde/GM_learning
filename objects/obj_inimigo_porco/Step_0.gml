/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Removendo o inimigo do Level após morte
if (sprite_index == spr_enemy_pig_dead)
{
	if(image_speed <= 0)
		image_alpha -= 0.01;
	
	if(image_alpha <= 0)
		instance_destroy();	
	
	exit;	
}

var _chao = place_meeting(x, y + 1, obj_grama);

//Validando se o Player Está no Chão para executar
if (_chao){		
	time_to_decide_walk -= 1;
	
	//Decision to walk or not
	if (time_to_decide_walk <= 0) {
		walking = choose(true, false);
		
		if (walking){
			vel_h = choose(vel, -vel);		
			sprite_index = spr_enemy_pig_run;
			image_xscale = vel_h;
		}
		else jd_event_to_stop();			
		
		
		
		time_to_decide_walk = game_get_speed(gamespeed_fps);// room_speed * 2;		
	}
	
	jd_can_fall_validate();
	
	if (place_meeting(x + vel_h, y, obj_grama)){
		vel_h *= -1;
		image_xscale = vel_h;
	}
}
else {
	jd_apply_gravity();
	jd_event_to_stop();
}

//Colocando sprite de dado no Inimigo;
if(damage){
	sprite_index = spr_enemi_pig_damage;
}