/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
#region //funções do porco

function jd_ativar_bomba()
{
	
}

function jd_ativar_canhao()
{
	
}

function jd_acender(_obj)
{
	switch(_obj){
		case "bomba":
			jd_ativar_bomba();
			break;
		case "canhao":
			jd_ativar_canhao();
			break;
		default:
	}
}


#endregion


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

if(sprite_index == spr_porco_fosforo_on){
	
	if(image_index >= image_number -1){
			sprite_index = spr_porco_fosforo_acender;
			image_index = 0;
	}
}
else if(sprite_index == spr_porco_fosforo_acender){		
		
		if (jd_frame_finalizado()){
			
			var _bomba = instance_place(x,y, obj_bomba);		
			if (_bomba){
				_bomba.momento_bomba = "on";			
				jd_mudar_sprite(spr_enemy_pig_idle);
			}
			
			var _canhao = instance_place(x, y, obj_canhao);
			if(_canhao){
				_canhao.sprite_index = spr_canhao_on;				
				jd_mudar_sprite(spr_enemy_pig_idle);
			}
		}
}
else
{
	//Checando se colidiu com uma bomba
	var _bomba = instance_place(x, y, obj_bomba);
	if(_bomba)
	{		
		if(_bomba && _bomba.momento_bomba == "off"){
			//Habilitando animação para riscar o fosforo
			sprite_index = spr_porco_fosforo_on;
			image_index = 0;
		}		
		jd_stop_movement();
	}
	
	//Checando se colidiu com um canhão
	var _canhao = instance_place(x,y, obj_canhao);
	if(_canhao)
	{		
		if(_canhao.sprite_index == spr_canhao_idle){
			sprite_index = spr_porco_fosforo_on;
			image_index = 0;
		}
		jd_stop_movement();
	}
	
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
} 

//Colocando sprite de dado no Inimigo;
if(damage){
	sprite_index = spr_enemy_pig_damage;
}