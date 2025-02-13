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
if jd_exterminando_inimigo(sprite_index)
	exit;

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
				_canhao.status_canhao = "espere";
			}
		}
}
else
{
	//Decide se pega ou acende a bomba
	var _pega_bomba = choose(true, false);
	//Checando se colidiu com uma bomba e se SIM, ativa ou pega bomba
	var _bomba = instance_place(x, y, obj_bomba);
	if(_bomba && _bomba.momento_bomba == "off")
	{			
		if(!_pega_bomba){
			sprite_index = spr_porco_fosforo_on;
			image_index = 0;		
			jd_stop_movement();
		}
		else{
			instance_destroy(_bomba);
			var _novo_porco_bomba = instance_create_layer(x, y, layer, obj_inimigo_porco_bomba);
			_novo_porco_bomba.sprite_index = spr_porco_bomba_pega;
			instance_destroy();
		}
	}
	
	//Checando se colidiu com uma bomba e se SIM, ativa a canhão
	var _canhao = instance_place(x,y, obj_canhao);
	if(_canhao && _canhao.status_canhao != "espere" && _canhao.sprite_index == spr_canhao_idle)
	{			
		sprite_index = spr_porco_fosforo_on;
		image_index = 0;		
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
//if(damage){
//	sprite_index = spr_enemy_pig_damage;
//}