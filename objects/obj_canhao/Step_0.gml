
switch(sprite_index)
{
	case spr_canhao_on:		
		if(image_index >= 1.5 && canhao_carregado){
			var _bola = instance_create_layer(x, y -11, layer, obj_bala_canhao);
			_bola.vel_h = 4 * image_xscale;
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