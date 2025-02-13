// Inherit the parent event
event_inherited();

jd_apply_gravity();

//Removendo o inimigo do Level após morte
if jd_exterminando_inimigo(sprite_index)
	exit;

//Se avistar o player e o porco joga a Bomba
jd_ver_o_player();

var _chao = place_meeting(x, y + 1, obj_grama);
if (_chao) {	
	
	switch (sprite_index)
	{
		case spr_porco_bomba_idle:
			jd_event_to_stop();		
			jd_timer_porco_bomba_encerrado(choose(spr_porco_bomba_run, spr_porco_bomba_idle));
		break;
	
		case spr_porco_bomba_run:	
			vel_h = vel;
			image_xscale = vel_h;
		
			jd_timer_porco_bomba_encerrado(choose(spr_porco_bomba_run, spr_porco_bomba_idle));
		break;
	
		case spr_porco_bomba_joga:
			if (image_index >= image_number -1){
				var _bomba = instance_create_layer(x, y -14, "projeteis", obj_bomba);
				_bomba.vel_h = 3 * image_xscale;
				_bomba.vel_v = -3;
				_bomba.momento_bomba = "on";
			
				instance_change(obj_inimigo_porco, true);
			}
		break;
	
		case spr_porco_bomba_pega:
			if (image_index >= image_number -1)
				jd_mudar_sprite(spr_porco_bomba_idle);
		break;
	}	
}
