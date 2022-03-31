/// @description Draw Stuff

// TODO: Rework to show collected items
/*
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
*/

draw_sprite_stretched(
	spr_inventory,                               // Sprite
	0,                                           // Frame
	(obj_player.x - 64)-6,                       // x
	(obj_player.y + 64)-6,                       // y
	12+rowLength*36,                             // width
	12+(((INVENTORY_SLOTS-1) div rowLength)+1)*36// height
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1) 
{
	var xx = (obj_player.x - 64) + (i mod rowLength) * 36 + 2;
	var yy = (obj_player.y + 64) + (i div rowLength) * 36 + 2;
	draw_sprite(spr_slot, 0, xx, yy) 
	if (inventory[i] != -1) {
		draw_sprite(spr_items,inventory[i],xx,yy);	
	}
	
}
