function respawn_player(entrance_id = 0) {
	if instance_exists(obj_entrance) {
		entrance = instance_find(obj_entrance, entrance_id);
		if entrance {
			new_x = entrance.x;
			new_y = entrance.y;
		} else {
			new_x = obj_entrance.x;
			new_y = obj_entrance.y;
		}
		obj_player.x = new_x;
		obj_player.y = new_y;
	} else {
		obj_player.x = 0;
		obj_player.y = 0;
	}
}