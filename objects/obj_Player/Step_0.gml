/// @description Insert description here
// You can write your code in this editor

//Movendo player
var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);



//Movimento para frente e para trás
vel_h = (_right - _left) * vel;

//Pulo
var _chao = place_meeting(x, y + 1, obj_grama);
vel_v += grav;	

if (_chao) {
	
	//Pulando
	if (_jump){		
		vel_v = -vel_jump;
		//sprite_index = spr_player_jump;
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
else { //No ar
		if (vel_v < 0)
			sprite_index = spr_player_jump;		
		else {
			sprite_index = spr_player_fall;
			
			//to kill enemy
			var _enemy = instance_place(x, y -1, obj_main_enemy);
			if (_enemy)
			{
				if (_enemy.sprite_index != spr_enemy_pig_dead)
				{
					vel_v = -vel_jump;
					_enemy.damage = true;
				}
			}
		}
		
		//vel_v += grav;	
		if (vel_h != 0){
			image_xscale = sign(vel_h);
		}
}