//End the enemy after Damage

if (sprite_index == spr_enemy_pig_damage){
	sprite_index = spr_enemy_pig_dead;
	vel_h = 0;
}

if (sprite_index == spr_enemy_pig_dead)
{	
	image_speed = 0;
	image_index = 3;
}