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

menu_stuff = array_create(1);

// Inventory
// TODO: Rework to show collected items
num_items = 30;

item_width = 64;
item_height = 64;
padding = 5;

num_rows = 10;
num_cols = ceil(num_items / num_rows);

rect_xscale = (item_width + padding) * num_rows;
rect_yscale = (item_height + padding) * num_cols;

start_x = room_width / 2 - rect_xscale / 2;
start_y = room_height / 2 - rect_yscale / 2;