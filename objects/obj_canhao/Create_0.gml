sprite_index = spr_canhao_idle;
status_canhao = "espere";
canhao_carregado = true;
tempo_tiro =  game_get_speed(gamespeed_fps) * 5;
timer_tiro = tempo_tiro;

jd_mudar_sprite = function (_sprite){
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		sprite_image = 0;
	}	
}