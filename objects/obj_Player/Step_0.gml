/// @description Insert description here
// You can write your code in this editor

//Movendo player
var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

#region Funções padrão do Player
function jd_player_skill_kill_enemy(_enemy = instance_place(x, y -1, obj_main_enemy)){
dano = false;
	if (_enemy)
	{
		dano = false;
		if (_enemy.sprite_index != spr_enemy_pig_dead)
		{
			vel_v = -vel_jump;
			_enemy.damage = true;
			_enemy.jd_mudar_sprite(spr_enemy_pig_damage);
		}
	}
}

function jd_player_set_damage (){
	dano = true;
	timer_dano = tempo_dano;
	invencivel_timer = invencivel_tempo;
}
#endregion

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
			sprite_index = spr_player_jump;		
		else {
			sprite_index = spr_player_fall;			
			//to kill enemy			
			jd_player_skill_kill_enemy(instance_place(x, y -1, obj_main_enemy));
		}		
		
		if (vel_h != 0){
			image_xscale = sign(vel_h);
		}
}


#region Tomando o Dano do Inimigo

if (dano){
	sprite_index = spr_player_hit;	
}

//Limitando o tempo de animão do dano
if(timer_dano > 0)
	timer_dano--;	

//controlando a invencibilidade
if (invencivel_timer > 0){
	invencivel_timer--;
	image_alpha = 0.5;	
}
else 
	image_alpha = 1;

//Tomando dano do inimigo
var _inimigo = instance_place(x, y, obj_main_enemy);
if (_inimigo && invencivel_timer <= 0){		
	if(_inimigo.sprite_index != spr_enemy_pig_dead && _inimigo.damage == false){
		dano = true;
		timer_dano = tempo_dano;
		invencivel_timer = invencivel_tempo;
	}
}
#endregion