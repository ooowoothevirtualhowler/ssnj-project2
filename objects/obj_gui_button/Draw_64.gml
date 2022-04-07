/// @description Draw Stuff

draw_set_alpha(btn_alpha);
draw_set_color(btn_color);
draw_button(x1, y1, x2, y2, button_up());

// Normally we would use the
// text object but that causes
// the text to be drawn under the
// button.
draw_set_alpha(text_alpha);
draw_set_color(text_color);
draw_set_halign(text_h_align);
draw_set_valign(text_v_align);
draw_text(x, y, text);
	
// Set back to defaults since
// this changes the globals
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);