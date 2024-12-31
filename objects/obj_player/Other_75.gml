var _evento = ds_map_find_value(async_load,"event_type");

switch(_evento)
{
	case "gamepad discovered":
		var _porta = ds_map_find_value(async_load, "pad_index");
		global.p1 = _porta
		global.gamepad = true;
		gamepad_set_axis_deadzone(0, 0.25)
	break;
	case "gamepad lost":
		
	break;
}