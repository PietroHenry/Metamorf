if (surface_exists(surf))
{
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	gpu_set_fog(true,c_black,0,0);
	
	with(obj_player){
		draw_sprite_ext(obj_player.sprite[movendo][lado][attack][dead],image_index,x,(y - obj_player.z) + sprite_height,obj_player.escala_y,-obj_player.escala_y ,image_angle,image_blend,image_alpha - 0.3)
	}
	with(obj_blob){
		draw_sprite_ext(sprite_index,image_index,x,(y - obj_blob.z) + sprite_height,obj_blob.escala_y,-obj_blob.escala_y ,image_angle,image_blend,image_alpha - 0.3)
	}
	
	gpu_set_fog(false,c_black,0,0);
	surface_reset_target();
	draw_surface(surf,0,0);
}else{surf = surface_create(room_width,room_height);}