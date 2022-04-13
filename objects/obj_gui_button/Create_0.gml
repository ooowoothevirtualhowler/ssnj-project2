/// @description Init

x1 = x - x_padding;
y1 = y - y_padding;
x2 = x + x_padding;
y2 = y + y_padding;

function within_bounds() {
	click_x = device_mouse_x_to_gui(0);
	click_y = device_mouse_y_to_gui(0);
	return x1 <= click_x and click_x <= x2 and y1 <= click_y and click_y <= y2;
}

function button_up() {
	return !device_mouse_check_button(0, mb_left) or !within_bounds();
}