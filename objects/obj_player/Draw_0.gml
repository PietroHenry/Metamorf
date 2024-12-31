escala_x = lerp(escala_x,1,0.3)
escala_y = lerp(escala_y,1,0.3)

draw_sprite_ext(sprite[movendo][lado][attack][dead], image_index, x, y + z, escala_x, escala_y, image_angle, image_blend, image_alpha);
sprite_index = sprite[movendo][lado][attack][dead]
//draw_sprite_ext(corpo, -1,x,y,1,1,0,c_white,1)
//draw_sprite_ext(spr_rostos, rosto,x,y,1,1,0,c_white,1)
//draw_sprite_ext(spr_cabelos, cabelo,x,y,1,1,0,c_white,1)