x = room_width / 2
y = room_height / 2
z = 0
grav = 0.1
forca_pulo = -4;
spd = 2
hspd = 0
vspd = 0
zspd = 0
escala_x = 1
escala_y = 1

inimigos_atingidos = ds_list_create();

vida = 100
vida_max = 100
energy = 100
energy_max = 100
dano = 10

#region idle

	sprite[0][0][0][0] = spr_player_idle_down
	sprite[0][1][0][0] = spr_player_idle_up
	sprite[0][2][0][0] = spr_player_idle_right
	sprite[0][3][0][0] = spr_player_idle_left

#endregion

#region free

	sprite[1][0][0][0] = spr_player_free_down
	sprite[1][1][0][0] = spr_player_free_up
	sprite[1][2][0][0] = spr_player_free_right
	sprite[1][3][0][0] = spr_player_free_left

#endregion

#region attack

	sprite[0][0][1][0] = spr_player_attack_down
	sprite[0][1][1][0] = spr_player_attack_up
	sprite[0][2][1][0] = spr_player_attack_right
	sprite[0][3][1][0] = spr_player_attack_left

	sprite[1][0][1][0] = spr_player_attack_down
	sprite[1][1][1][0] = spr_player_attack_up
	sprite[1][2][1][0] = spr_player_attack_right
	sprite[1][3][1][0] = spr_player_attack_left

#endregion

#region dead

	sprite[0][0][1][1] = spr_player_dead
	sprite[0][1][1][1] = spr_player_dead
	sprite[0][2][1][1] = spr_player_dead
	sprite[0][3][1][1] = spr_player_dead

	sprite[0][0][0][1] = spr_player_dead
	sprite[0][1][0][1] = spr_player_dead
	sprite[0][2][0][1] = spr_player_dead
	sprite[0][3][0][1] = spr_player_dead

	sprite[1][0][0][1] = spr_player_dead
	sprite[1][1][0][1] = spr_player_dead
	sprite[1][2][0][1] = spr_player_dead
	sprite[1][3][0][1] = spr_player_dead

	sprite[1][0][1][1] = spr_player_dead
	sprite[1][1][1][1] = spr_player_dead
	sprite[1][2][1][1] = spr_player_dead
	sprite[1][3][1][1] = spr_player_dead

	sprite[0][0][1][1] = spr_player_dead
	sprite[0][1][1][1] = spr_player_dead
	sprite[0][2][1][1] = spr_player_dead
	sprite[0][3][1][1] = spr_player_dead

#endregion

movendo = 0
lado = 0
attack = 0
dead = 0

checa_gamepad = function(){
	var _qtd	 = gamepad_get_device_count();
	var _gamepad = 0;
	for (var _i = 0; _i < _qtd; _i++){
		ds_list_add(global.controles, gamepad_is_connected(_i))
		if (gamepad_is_connected(_i))
		{
			_gamepad++;
		}
	}
	if (_gamepad)
	{gamepad_set_axis_deadzone(0, 0.25)}
	global.p1 = ds_list_find_value(global.controles,1)
	return _gamepad;
}

controla = function(){
	if (global.gamepad)
	{
		controla_gamepad();
	}else{
		controla_keyboard();
	}
}

controla_keyboard = function(){
	global.connect = true
	var _up, _down, _left, _right, _pulo;
	
	_up		= keyboard_check(vk_up) 	or keyboard_check(ord("W"));
	_down	= keyboard_check(vk_down) or keyboard_check(ord("S"));
	_left	= keyboard_check(vk_left) or keyboard_check(ord("A"));
	_right	= keyboard_check(vk_right) or keyboard_check(ord("D"));
	_pulo	= keyboard_check_pressed(vk_space);
	
	var _xInput = (_right - _left);
	var _yInput = (_down - _up);
	
	if abs(_xInput) + abs(_yInput) > 1 {
		_xInput *= 0.7071;
		_yInput *= 0.7071;
	}
	
	if _pulo and z = 0 {
		zspd = forca_pulo
		escala_x = 0.5
		escala_y = 1.5
	}
	
	hspd = _xInput * spd;
	vspd = _yInput * spd;
}

controla_gamepad = function(){
	global.connect = true
	hspd = gamepad_axis_value(global.p1,gp_axislh)
	vspd = gamepad_axis_value(global.p1,gp_axislv)
	show_debug_message("gamepad")
}

efeito1 = function(_mudar = false){
	static _escala = 1;
	
	if (_mudar and _escala = 1)
	{_escala = 2;}
	
	image_xscale = _escala;
	image_yscale = _escala;
	
	if (_escala > 1){
		_escala =  lerp(_escala,1,0.1);
	}
}

state = scr_player_idle