/// @description Init

rect_padding = 100;

start_x = x - rect_padding;
start_y = y - rect_padding;
end_x = x + rect_padding;
end_y = y + rect_padding;

spr_width = 25;
spr_height = 25;

function lerp_pos(pos_x, pos_y) {
	return [lerp(start_x, end_x, pos_x / room_width), lerp(start_y, end_y, pos_y / room_height)];
}

function render_instances(obj, spr, width = spr_width, height = spr_height) {
	if instance_exists(obj) {
	for (var i = 0; i < instance_number(obj); i++) {
		instance = instance_find(obj, i);
		if instance {
			draw_positions = lerp_pos(instance.x, instance.y);
	
			draw_sprite_stretched(spr, 0, draw_positions[0], draw_positions[1], width, height);
		}
	}
}
}