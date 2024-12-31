z = 0
escala_x = 1
escala_y = 1

if distance_to_object(obj_player) <= 100 {instance_destroy()}
if distance_to_object(obj_player) >= 150 {instance_destroy()}
if distance_to_object(obj_blob) <= 20 {instance_destroy()}

hspd = 0
vspd = 0

//show_debug_message(x)
//show_debug_message(y)