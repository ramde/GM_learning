/// @description Insert description here
// You can write your code in this editor


jd_print_pv = function()
{
	var _space_x = 20;	
	for (var _i = 1; _i <= global.pv; _i += 1){
		
		if (_i > 1)
			_space_x += 30;
		
		draw_sprite_ext(spr_player_pv, 8 * (get_timer() / 1000000), _space_x, 50, 2, 2, 0, c_white, 1);
	}
}