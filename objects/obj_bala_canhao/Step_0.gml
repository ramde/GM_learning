// Inherit the parent event
event_inherited();

vel_v += grav;

if(place_meeting(x, y + 1, obj_grama) && vel_h != 0)
	vel_h *= .92;
else vel_h *= .995;

//Virado uma bomba
if abs(vel_h) <= 0.1 {	
	var _bomba_trans = instance_create_layer(x, y + sprite_height / 2 , layer, obj_bomba);	
	_bomba_trans.momento_bomba = choose("off", "on");
	instance_destroy();
}

//Se o tiro acertar, dar dano no inimigo
//jd_set_damage_on_player();
var _player = instance_place(x, y, obj_player);
if(_player && _player.perde_pv){
	_player.jd_player_set_damage()
}

var _bomba = instance_place(x, y, obj_bomba);
if(_bomba && _bomba.momento_bomba == "off")
{			
	_bomba.momento_bomba = "on";
}