
switch(sprite_index)
{
	case spr_canhao_on:		
		if(image_index >= 1.5 && canhao_carregado){
			var _bola = instance_create_layer(x  + (5 * image_xscale), y -11, "projeteis", obj_bala_canhao);
			_bola.vel_h = choose(3, 4, 7) * image_xscale;			
			_bola.vel_v = choose(-3,-2, -1);
			canhao_carregado = false;
		}
			
		if(image_index >= image_number -1){
			jd_mudar_sprite(spr_canhao_idle);			
		}
	break;
	
	default:
		if status_canhao == "espere" {
			timer_tiro--;
			
			if(timer_tiro <= 0){
				timer_tiro = tempo_tiro;	
				status_canhao = "carregada";
				canhao_carregado = true;
			}		
		}
}