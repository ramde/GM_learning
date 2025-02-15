/// @description Insert description here
// You can write your code in this editor


switch (sprite_index)
{
	case spr_player_door_in:
		jd_get_in_door();
	break;
	
	case spr_player_door_out:
		jd_get_out_door();
	break;
	
	default:
		jd_player_default_actions();
}






