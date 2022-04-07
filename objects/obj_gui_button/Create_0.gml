/// @description Init

x1 = x - x_padding;
y1 = y - y_padding;
x2 = x + x_padding;
y2 = y + y_padding;

function within_bounds() {
	return x1 <= mouse_x and mouse_x <= x2 and y1 <= mouse_y and mouse_y <= y2;
}

function button_up() {
	return !mouse_check_button(mb_left) or !within_bounds();
}