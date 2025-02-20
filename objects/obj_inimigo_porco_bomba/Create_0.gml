// Inherit the parent event
event_inherited();

sprite_index = spr_porco_bomba_idle;
vel = choose(1, -1);

tempo_porco_bomba = game_get_speed(gamespeed_fps) * 5;
timer_porco_bomba = tempo_porco_bomba;
visao = 100;

jd_timer_porco_bomba_encerrado = function(_nova_sprint){
	timer_porco_bomba--;
	
	if (timer_porco_bomba <= 0){
		jd_mudar_sprite(_nova_sprint);
		image_index = 0;
		timer_porco_bomba = tempo_porco_bomba;
	}		
}

jd_ver_o_player = function()
{
	var _vi_player = collision_line(x, y -14, x + visao, y - 14, obj_player, false, true);
	if (_vi_player){
		jd_mudar_sprite(spr_porco_bomba_joga);
	}
}