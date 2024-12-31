var _ativa_menu = function()
{
	switch(atual)
	{
		case 0:
			room_goto_next()
			//layer_sequence_create("transicao",room_width / 2,room_height / 2,seq_transicao_f)
		break;
		case 1:
			//layer_sequence_create("transicao",room_width / 2,room_height / 2,seq_transicao_f)
			game_end()
		break;
	}
}

if gamepad_is_connected(global.p1)
{
	if (gamepad_button_check_released(global.p1,gp_face2))
	{
		_ativa_menu();
	}
	if (gamepad_button_check_released(global.p1,gp_padu))
	{
		atual += 1
		audio_play_sound(snd_troca_de_selesao,0,false)
	}
	if (gamepad_button_check_released(global.p1,gp_padd))
	{
		atual --;
		audio_play_sound(snd_troca_de_selesao,0,false)
	}
}else{
	if (keyboard_check_pressed(vk_enter))
	{
		_ativa_menu();
	}
	if (keyboard_check_pressed(vk_down))
	{
		atual += 1
		audio_play_sound(snd_troca_de_selesao,0,false)
	}
	if (keyboard_check_pressed(vk_up))
	{
		atual --;
		audio_play_sound(snd_troca_de_selesao,0,false)
	}
}

timer = lerp(timer,0,1)

atual = clamp(atual,0,array_length(menu)-1)

//gamepad_axis_value(global.controle, gp_axislv) < 0.25;
//gamepad_axis_value(global.controle, gp_axislv) > -0.25;
//gamepad_button_check_pressed(global.controle,gp_face2);
//gamepad_button_check_released(global.controle,gp_face2);
//gamepad_button_check_pressed(global.controle,gp_face3);