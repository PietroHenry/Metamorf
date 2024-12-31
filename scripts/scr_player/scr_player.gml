function scr_player_idle(){
	 var _pulo	= keyboard_check_pressed(vk_space);
	movendo = 0
	attack = 0
	dead = 0
	hspd = 0
	vspd = 0
	if _pulo and z = 0 {
		zspd = forca_pulo
		escala_x = 0.5
		escala_y = 1.5
	}
	//zspd += grav
	
		if ((keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || (keyboard_check(ord("D")))) || (gamepad_axis_value(global.p1, gp_axislh) > 0.25 || gamepad_axis_value(global.p1, gp_axislh) < -0.25 || gamepad_axis_value(global.p1, gp_axislv) > 0.25 || gamepad_axis_value(global.p1, gp_axislv) < -0.25)) || keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_left) || (keyboard_check(vk_right)){
			state = scr_player_free
		}
		if keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_numpad0)
		{
			ds_list_clear(inimigos_atingidos)
			switch(lado){
				case 0:
					mask_index = spr_player_attack_down_hb
				break;
				case 1:
					mask_index = spr_player_attack_up_hb
				break;
				case 2:
					mask_index = spr_player_attack_right_hb
				break;
				case 3:
					mask_index = spr_player_attack_left_hb
				break;
			}
			state = scr_player_attack
		}
	}
function scr_player_free(){
	if z > 0 
	{movendo = 0}else{movendo = 1}
	attack = 0
	
	controla();
	
	#region colisão
	if place_meeting(x+hspd,y,obj_wall){
		while(!place_meeting(x+sign(hspd),y,obj_wall)){
			x = x + sign(hspd);
		}
		hspd = 0;
	}
	if place_meeting(x,y+vspd,obj_wall){
		while(!place_meeting(x,y+sign(vspd),obj_wall)){
			y = y + sign(vspd);
		}
		vspd = 0;
	};
	#endregion
	
	if (hspd = 0 and vspd = 0) or (!keyboard_check(ord("W")) || !keyboard_check(ord("S")) || !keyboard_check(ord("A")) || (!keyboard_check(ord("D"))) || (!gamepad_axis_value(global.p1, gp_axislh) > 0.25 || !gamepad_axis_value(global.p1, gp_axislh) < -0.25 || !gamepad_axis_value(global.p1, gp_axislv) > 0.25 || !gamepad_axis_value(global.p1, gp_axislv) < -0.25)) || !keyboard_check(vk_up) || !keyboard_check(vk_down) || !keyboard_check(vk_left) || (!keyboard_check(vk_right))
	{state = scr_player_idle}
	
	if keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.p1,gp_face2)
	{
		ds_list_clear(inimigos_atingidos)
		switch(lado){
			case 0:
				mask_index = spr_player_attack_down_hb
			break;
			case 1:
				mask_index = spr_player_attack_up_hb
			break;
			case 2:
				mask_index = spr_player_attack_right_hb
			break;
			case 3:
				mask_index = spr_player_attack_left_hb
			break;
		}
		state = scr_player_attack
	}
	
	if hspd > 0 {lado = 2}
	if hspd < 0 {lado = 3}
	if vspd > 0 {lado = 0}
	if vspd < 0 {lado = 1}
	
}
function scr_player_attack(){
    attack = 1;
	hspd = 0
	vspd = 0
	image_speed = 0
	
	var _inimigos_na_hitbox = ds_list_create();
	var _inimigos = instance_place_list(x,y,obj_blob,_inimigos_na_hitbox,false);
	if _inimigos > 0
	{
		for (var _i = 0; _i < _inimigos; _i++)
		{
			var _inimigoID = _inimigos_na_hitbox[| _i];
			
			if (ds_list_find_index(inimigos_atingidos, _inimigoID)) == -1{
				ds_list_add(inimigos_atingidos,_inimigoID);
				
				with(_inimigoID){
					vida -= dano
				}
			}
		}
	}
	ds_list_destroy(_inimigos_na_hitbox);
	
	if fim_da_animacao(){
		attack = 0
		state = scr_player_free;
	}
}

function scr_player_dead(){
	dead = 1
}