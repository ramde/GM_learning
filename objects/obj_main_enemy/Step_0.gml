// Inherit the parent event
event_inherited();

//IA para que o inimigo saiba se pode eu não cair de alguma lugar em que esteja andando
function jd_can_fall_validate(){
	if (!can_fall){
		if(!place_meeting(x + vel_h * 10, y + 1, obj_grama)){
			vel_h *= -1;
			image_xscale = vel_h;
		}
	}
}

function jd_event_to_stop(){
	if (vel_h != 0){
		vel_h = 0;
		sprite_index = spr_enemy_pig_idle;
	}
}

function jd_exterminando_inimigo(_sprite_corrente) 
{
	var _inimido_exterminado = false;
	//Removendo o inimigo do Level após morte
	if (_sprite_corrente == spr_enemy_pig_dead)
	{
		if(image_speed <= 0)
			image_alpha -= 0.01;
	
		if(image_alpha <= 0)
			instance_destroy();	
	
		_inimido_exterminado = true;
	}
	
	return _inimido_exterminado
}