/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Removendi o inimigo do Level após morte
if (sprite_index == spr_enemy_pig_dead)
{
	if(image_speed <= 0)
		image_alpha -= 0.001;
		
	if(image_alpha <= 0)
		instance_destroy();	
	
	exit;	
}


//IA para que o inimigo saiba se pode eu não cair de alguma lugar em que esteja andando
function c_can_fall_validate(){
	if (!can_fall){
		if(!place_meeting(x + vel_h * 10, y + 1, obj_grama)){
			vel_h *= -1;
		}
	}
}

var _chao = place_meeting(x, y + 1, obj_grama);



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
		else c_event_to_stop();				
		
		time_to_decide_walk = room_speed * 2;		
	}
	
	c_can_fall_validate();
	
	if (place_meeting(x + vel_h, y, obj_grama)){
		vel_h *= -1;
		image_xscale = vel_h;
	}
}
else {
	c_apply_gravity();
	c_event_to_stop();
}

//Colocando sprite de dado no Inimigo;
if(damage){
	sprite_index = spr_enemi_pig_damage;
}