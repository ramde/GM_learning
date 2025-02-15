
switch (sprite_index)
{
	case spr_door_idle:
		var _player = instance_place(x, y, obj_Player);
		if (_player && keyboard_check(ord("W"))){
			jd_g_mudar_sprite(spr_door_opening);
			_player.sprite_index = spr_player_door_in;
		}
	break;
	
	case spr_door_opening:
		if(image_index >= image_number -1)
			image_speed = 0;
	break;
	
	default:
		jd_g_mudar_sprite(spr_door_closing);
		if (image_index >= image_number -1)
			jd_g_mudar_sprite(spr_door_idle);
	break;	
}