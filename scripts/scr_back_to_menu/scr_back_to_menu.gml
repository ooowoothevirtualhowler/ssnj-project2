function back_to_menu() {
	if instance_exists(obj_gui_main)
		instance_destroy(obj_gui_main.id);
	
	if instance_exists(obj_camera)
		instance_destroy(obj_camera.id);
		
	if instance_exists(obj_player)
		instance_destroy(obj_player.id);
	
	room_goto(TitleScreen);
}