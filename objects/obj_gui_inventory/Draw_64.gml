/// @description Draw Stuff

// TODO: Rework to show collected items

start_x = x - rect_xscale / 2;
start_y = y - rect_yscale / 2;
end_x = x + rect_xscale / 2;
end_y = y + rect_yscale / 2;
counter = 0;
draw_set_color(c_gray);
draw_rectangle(start_x, start_y, end_x, end_y, false);
draw_set_color(c_white);

for (i = 0; i < num_rows; i++) {
	for (j = 0; j < num_cols; j++) {
		// If we populated the inventory
		// entirely, break out
		if counter >= num_items
			break;
		
		item_x = (start_x + obj_item.sprite_xoffset) + (obj_item.sprite_width + padding) * i;
		item_y = (start_y + obj_item.sprite_yoffset) + (obj_item.sprite_height + padding) * j;
		
		draw_sprite(spr_item, 0, item_x, item_y);
		
		counter++;
	}
}

