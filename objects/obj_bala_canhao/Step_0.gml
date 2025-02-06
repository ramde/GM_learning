// Inherit the parent event
event_inherited();

vel_v += grav;

if(place_meeting(x, y + 1, obj_grama) && vel_h != 0){
	vel_h *= .92;
}
else vel_h *= .995;

//Virado uma bomba
if abs(vel_h) <= 0.1 {	
	instance_create_layer(x, y + sprite_height / 2 , layer, obj_bomba);	
	instance_destroy();
}