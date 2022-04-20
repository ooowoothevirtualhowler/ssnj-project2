/// @description Init

enum States {
	Closed,
	MainMenu,
	Inventory
}

last_state = States.MainMenu;
state = States.Closed;

function change_state(new_state) {
	last_state = state;
	state = new_state;
	event_perform(ev_other, ev_user0);
}

menu_stuff = array_create(0);

// Inventory

// Wait until opened to calculate for first time
num_item_slots = noone;

no_items_msg = noone;

item_width = 200;
item_height = 115;

padding = 5;
quit_padding = 30;

num_rows = 5;

rect_xscale = (item_width + padding) * num_rows;

start_x = room_width / 2 - rect_xscale / 2;

function compute_inventory(refresh=true) {
	num_item_slots = array_length(obj_player.inventory);
	
	num_cols = ceil(num_item_slots / num_rows);
	
	rect_yscale = (item_height + padding) * num_cols;
	
	start_y = room_height / 2 - rect_yscale / 2 - 150;
	
	// Refresh the screen
	if refresh
		event_perform(ev_other, ev_user0);
}

