function create_text(pos_x, pos_y, text, destroy_after = -1, alpha = 1.0, color = c_white, h_align = fa_center, v_align = fa_middle) {
	text_inst = instance_create_layer(pos_x, pos_y, "Instances", obj_text_spawner);
	text_inst.h_align = h_align;
	text_inst.v_align = v_align;
	text_inst.text_alpha = alpha;
	text_inst.text_color = color;
	text_inst.text_to_draw = text;
	text_inst.destroy_after = destroy_after;
	return text_inst;
}