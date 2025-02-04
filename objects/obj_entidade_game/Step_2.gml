/// @description Insert description here
// You can write your code in this editor

#region Colisão Horizontal
var _colh = instance_place(x + vel_h, y, obj_grama);
if(_colh){
	
	//Checando colisão para direita
	if (vel_h > 0) {
		x = _colh.bbox_left + (x - bbox_right);
	}
	
	//Checando colisão para esquerda
	if (vel_h < 0) {
		x = _colh.bbox_right + (x - bbox_left);
	}
	
	vel_h = 0
}
x += vel_h;
#endregion


#region Colisão vertial
var _colv = instance_place(x, y + vel_v, obj_grama);

if (_colv) {
	//Checando colisão para baixo
	if (vel_v > 0) {
		y = _colv.bbox_top + (y - bbox_bottom);
	}
	
	//checando colisão para cima
	if (vel_v < 0) {
		y = _colv.bbox_bottom + (y - bbox_top);
	}
	vel_v = 0;
}

y += vel_v;
#endregion