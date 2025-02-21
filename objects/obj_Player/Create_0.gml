/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Players' Skills
vel_jump = 8;
perde_pv = true;
dano = false;
tempo_dano = game_get_speed(gamespeed_fps);
timer_dano = 0;

//Invencivel
invencivel_tempo = game_get_speed(gamespeed_fps) * 3;
invencivel_timer = 0;

//Timer para reiniciar o Game depois de morrer
restart_timer = game_get_speed(gamespeed_fps) * 3;


jd_start_countdown_to_restart_game = function(){
	restart_timer--;
	if restart_timer <= 0 {
		global.pv = global.max_pv;
		game_restart();
	}
}


inputs = {
	left : ord("A"),
	right : ord("D"),
	jump : vk_space
}

//Definindo Estado inicial
jd_g_mudar_sprite(spr_player_door_out);

#region habilidades do Player
jd_jump_kill_enemy = function (_enemy = instance_place(x, y -1, obj_main_enemy)){
dano = false;
perde_pv = false;
	if (_enemy)
	{
		if (_enemy.sprite_index != spr_enemy_pig_dead)
		{
			vel_v = -vel_jump;
			_enemy.damage = true;
			_enemy.jd_mudar_sprite(spr_enemy_pig_damage);			
		}
	}
	perde_pv = true;
}

jd_kill_player = function(){	
	jd_g_mudar_sprite(spr_player_dead);	
}
jd_player_set_damage = function (){		
	
	dano = true;	
	timer_dano = tempo_dano;
	invencivel_timer = invencivel_tempo;	
	
	if perde_pv
		global.pv--;
	
	perde_pv = false;
	
	if global.pv == 0
		jd_kill_player();
}

jd_get_in_door = function()
{	
	var _img_vel = sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
	if (sprite_index == spr_player_door_in && image_index >= image_number	- _img_vel)
	{
		image_speed = 0;
		image_index = image_number -1;		
		image_alpha = 0;
	}
}

jd_get_out_door = function()
{
	var _img_vel = sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
	if (image_index >= image_number	- _img_vel)
		jd_g_mudar_sprite(spr_player_idle);
}

#endregion


jd_player_default_actions = function()
{
	//Movendo player
	var _left, _right, _jump;
	_left = keyboard_check(inputs.left);
	_right = keyboard_check(inputs.right);
	_jump = keyboard_check_pressed(inputs.jump);	
	
	//Validando se o Player não esta preso na animação de DANO
	if (timer_dano <= 0)
	{
		//Movimento para frente e para trás
		vel_h = (_right - _left) * vel;
	}
	

	//Pulo
	var _chao = place_meeting(x, y + 1, obj_grama);
	vel_v += grav;	

	if (_chao) {
	
		//Pulando
		if (_jump){		
			vel_v = -vel_jump;
			sprite_index = spr_player_jump;
		}
	
		//Trocando Sprite para do de movimento
		if (vel_h != 0) {
			sprite_index = spr_player_run;
			//Virando a imagem
			image_xscale = sign(vel_h);
		}
		else {
			sprite_index = spr_player_idle;
		}
	}
	else { 
		//player no ar
			if (vel_v < 0)
				jd_g_mudar_sprite(spr_player_jump);		
			else {
				jd_g_mudar_sprite(spr_player_fall);		
				jd_jump_kill_enemy(instance_place(x, y -1, obj_main_enemy));
			}		
		
			if (vel_h != 0){
				image_xscale = sign(vel_h);
			}
	}

	if (dano && sprite_index != spr_player_dead){
		jd_g_mudar_sprite(spr_player_hit);		
	}

	//Limitando o tempo de animão do dano
	if(timer_dano > 0)
		timer_dano--;
		
	if (sprite_index == spr_player_hit && image_index <= image_number -1 && timer_dano == 0)
		image_speed = 0;		
	

	//controlando a invencibilidade
	if (invencivel_timer > 0){
		invencivel_timer--;
		image_alpha = 0.5;	
	}
	else {
		image_alpha = 1;
		perde_pv = true;
	}

	//Tomando dano do inimigo
	var _inimigo = instance_place(x, y, obj_main_enemy);
	if (_inimigo && invencivel_timer <= 0){		
		if(_inimigo.sprite_index != spr_enemy_pig_dead && !_inimigo.damage){
			jd_player_set_damage();
		}
	}
}