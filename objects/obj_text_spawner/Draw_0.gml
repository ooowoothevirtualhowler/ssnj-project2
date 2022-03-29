/// @description Text draw

alarm_val = alarm_get(0);
if alarm_val {
	// Make the text fade out as the alarm runs
	draw_set_alpha(alarm_val / time_until_destroy);
} else {
	draw_set_alpha(text_alpha);
}
draw_set_color(text_color);
draw_set_halign(h_align);
draw_set_valign(v_align);
draw_text(x, y, text_to_draw);

if destroy_after != -1 {
	alarm[0] = destroy_after;
	
	// Store this so it can be used later
	time_until_destroy = destroy_after;
	
	// Do this to stop the alarm from
	// resetting every draw
	destroy_after = -1;
}

// Set back to defaults since
// this changes the globals
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);