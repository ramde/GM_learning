/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Players' Skills
vel_jump = 8;

dano = false;
tempo_dano = game_get_speed(gamespeed_fps);
timer_dano = 0;

inputs = {
	left : ord("A"),
	right : ord("D"),
	jump : vk_space
}
