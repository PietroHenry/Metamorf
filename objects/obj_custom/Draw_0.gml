//var _x = obj_player.x + 20;
//var _y = obj_player.y + 40;
//var _sep = 2;
//var _bgh = sprite_get_height(spr_background);
//var _barh = sprite_get_height(spr_bar);
//
//mod_selecionado += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"))
//var _mod_selecionado = clamp(mod_selecionado,0,mod_selecionado - 1)
//
//for (var _i = 0; _i < modificador; _i++){
//	if _i == mod_selecionado{
//		draw_set_alpha(1);
//	}else{
//		draw_set_alpha(0.5);
//	}
//	if _i == CUSTOM.CABELO or _i == CUSTOM.ROSTO or _i == CUSTOM.CORPO{
//		draw_sprite(spr_background, 0,_x,_y);
//		
//		_y += _bgh + _sep
//	}else{
//		draw_sprite(spr_bar,0,_x,_y);
//		_y += _bgh + _sep
//	}
//}