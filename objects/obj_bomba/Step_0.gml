// Inherit the parent event
event_inherited();

jd_apply_gravity();

if(place_meeting(x, y + 1, obj_grama) && vel_h != 0)
	vel_h *= .92;
else vel_h *= .995;

#region Armando e explodindo a bomba
var jd_armando_bomba = function(){
	sprite_index = spr_bomba_on;
	
	if(boom_tempo > 0)
		boom_tempo--;	
	else
		momento_bomba = "boom";
}

var jd_explosao_bomba = function(){
	
	//checando se a chamada veio após bomba armada
	if(sprite_index == spr_bomba_on){
		sprite_index = spr_bomba_boom;
		image_index = 0;		
	}
	
	//Destruindo Sprint após explosão
	if(image_index >= image_number -1){		
		var _bomba = instance_place(x, y, obj_bomba);
		if (_bomba && _bomba.momento_bomba == "off"){
			show_debug_message("entreou");
			_bomba.momento_bomba = "on";		
		}
		instance_destroy();		
	}
	
	var _player = instance_place(x,y, obj_player);
	if(_player){
		with (_player) {
			jd_player_set_damage();
		}
	}
}
#endregion


#region Validando momento da bomba
switch (momento_bomba){
	case "on":
		jd_armando_bomba();
	break;
	
	case "boom":
		jd_explosao_bomba();
	break;
	
	default:
		sprite_index = spr_bomba;
}	
#endregion