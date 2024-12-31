var _meio_tela_h = display_get_gui_height() / 2
var _meio_tela_w = display_get_gui_width() / 2
draw_set_font(fnt_menu)
var _alt = string_height("I")

draw_set_valign(1);

for (var _i = 0; _i < array_length(menu); _i++){
	var _cor = c_white;
	
	if (_i == atual)
	{
		_cor = c_red;
	}
	
	draw_set_color(_cor);
	draw_text(300,_meio_tela_h + (_alt * _i) - 80,menu[_i]);
	draw_set_color(-1);
}

draw_set_valign(0);
draw_set_font(-1);