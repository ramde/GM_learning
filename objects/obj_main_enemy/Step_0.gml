// Inherit the parent event
event_inherited();

//IA para que o inimigo saiba se pode eu não cair de alguma lugar em que esteja andando
function jd_can_fall_validate(){
	if (!can_fall){
		if(!place_meeting(x + vel_h * 10, y + 1, obj_grama)){
			vel_h *= -1;
			image_xscale = vel_h;
		}
	}
}
