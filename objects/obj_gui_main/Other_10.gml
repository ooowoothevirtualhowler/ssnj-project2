/// @description Change Menus

function inventory_callback() {
	// Since this will be called by a different object,
	// we must explicitly tell it where the method
	// is defined
	obj_gui_main.change_state(States.Inventory);
}

function close_callback() {
	obj_gui_main.change_state(States.Closed);
}

function back_callback() {
	obj_gui_main.change_state(States.MainMenu);
}

function room_restart_callback() {
	obj_gui_main.change_state(States.Closed);
	room_restart();
}

function quit_callback() {
	obj_gui_main.change_state(States.Closed);
	game_end();
}

function create_btn(x_pos, y_pos, callback, text, text_color=c_black) {
	btn = instance_create_layer(x_pos, y_pos, "GUI", obj_gui_button);
	btn.click_callback = callback;
	btn.text = text;
	btn.text_color = text_color;
	array_push(menu_stuff, btn);
}

function create_inventory_item(x_pos, y_pos) {
	item = instance_create_layer(x_pos, y_pos, "GUI", obj_item);
	item.for_inventory = true;
	array_push(menu_stuff, item);
}

while array_length(menu_stuff) {
	menu_element = array_pop(menu_stuff);
	if menu_element
		instance_destroy(menu_element.id);
}

if state == States.MainMenu {
	create_btn(room_width / 2, 100, inventory_callback, "Open Inventory");
	create_btn(room_width / 2, 215, room_restart_callback, "Restart Room");
	create_btn(room_width / 2, 330, close_callback, "Back To Game");
	create_btn(room_width / 2, 445, quit_callback, "Quit Game");
} else if state == States.Inventory {
	// TODO: Rework to show collected items
	counter = 0;
	
	for (i = 0; i < num_rows; i++) {
		for (j = 0; j < num_cols; j++) {
			// If we populated the inventory
			// entirely, break out
			if counter >= num_items
				break;
		
			item_x = (start_x + item_width / 2) + (item_width + padding) * i;
			item_y = (start_y + item_height / 2) + (item_height + padding) * j;
		
			create_inventory_item(item_x, item_y);
		
			counter++;
		}
	}
	btn_y = (start_y + item_height / 2) + (item_height + padding) * num_cols;
	create_btn(room_width / 2, btn_y + 50, back_callback, "Back To Main Menu");
}