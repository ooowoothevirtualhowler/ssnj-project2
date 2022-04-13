/// @description Create menu
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

draw_set_font(Font1)
draw_set_valign(fa_bottom)
draw_set_halign(fa_left)

for (var i = 0; i < op_length; i++)
{
	if (pos == 0) {
		draw_sprite(spr_cursor, image_index, obj_title_menu.x, 570);
	} else if (pos == 1) {
		draw_sprite(spr_cursor, image_index, obj_title_menu.x, 670);
	} else if (pos == 2) {
		draw_sprite(spr_cursor, image_index, obj_title_menu.x, 770);
	}

	var_c = c_white;
	
	if pos  == i {
		_c = c_white;
	}
	
	draw_text_color(x + op_border, y + op_border + op_space * i, option[i], _c, _c, _c, _c, 1);
}