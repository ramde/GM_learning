sprite_index = spr_canhao_idle;

jd_mudar_sprite = function (_sprite){
	if(sprite_index != _sprite){
		sprite_index = _sprite;
		sprite_image = 0;
	}	
}