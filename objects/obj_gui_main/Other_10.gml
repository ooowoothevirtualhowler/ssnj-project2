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
	
	// Help get player unstuck
	obj_player.x = room_width / 2;
	obj_player.y = room_height / 2;
}

function quit_callback() {
	obj_gui_main.change_state(States.Closed);
	back_to_menu();
}

function create_btn(x_pos, y_pos, callback, text, text_color=c_black) {
	btn = instance_create_layer(x_pos, y_pos, "GUI", obj_gui_button);
	btn.click_callback = callback;
	btn.text = text;
	btn.text_color = text_color;
	array_push(menu_stuff, btn);
	return btn;
}

function create_inventory_text(x_pos, y_pos, text, text_color=c_black) {
	text = create_text(x_pos, y_pos, text, -1, 1.0, text_color);
	array_push(menu_stuff, text);
	return text;
}

function create_inventory_item_btn(x_pos, y_pos, item, text_color=c_black) {
	item_btn = instance_create_layer(x_pos, y_pos, "GUI", obj_gui_inventory_button);
	item_btn.item_sprite = item.sprite_index;
	item_btn.text = item.item_name;
	item_btn.text_color = text_color;
	array_push(menu_stuff, item_btn);
	return item_btn;
}

function show_no_items() {
	msg_y = (start_y + item_height / 2) + (item_height + padding) * (num_cols - 1);
	no_items_msg = create_inventory_text(room_width / 2, msg_y, "No items.");
}

function hide_no_items() {
	if no_items_msg != noone
		instance_destroy(no_items_msg.id);
}

while array_length(menu_stuff) {
	menu_element = array_pop(menu_stuff);
	if menu_element
		instance_destroy(menu_element.id);
}

if state == States.MainMenu {
	create_btn(room_width / 2, 100, inventory_callback, "Open\nInventory");
	create_btn(room_width / 2, 215, room_restart_callback, "Restart Room");
	create_btn(room_width / 2, 330, close_callback, "Back To Game");
	create_btn(room_width / 2, 445, quit_callback, "Back to\nTitle Screen");
} else if state == States.Inventory {
	if num_item_slots == noone
		compute_inventory(false);
		
	counter = 0;
	
	if num_item_slots > 0 {
		for (i = 0; i < num_rows; i++) {
			for (j = 0; j < num_cols; j++) {
				// If we populated the inventory
				// entirely, break out
				if counter >= num_item_slots
					break;
				
				item = array_get(obj_player.inventory, counter);
				
				if item != 0 {
					item_x = (start_x + item_width / 2) + (item_width + padding) * i;
					item_y = (start_y + item_height / 2) + (item_height + padding) * j;
					
					create_inventory_item_btn(item_x, item_y, item);
		
					counter++;
				}
			}
		}
	}
	
	// We don't have any items
	if counter == 0 {
		no_items_msg = show_no_items();
	} else if no_items_msg {
		hide_no_items();
	}
	
	btn_y = (start_y + item_height / 2) + (item_height + padding) * (num_cols - 1) + quit_padding;
	create_btn(room_width / 2, btn_y + 50, back_callback, "Back To\nMain Menu");
}