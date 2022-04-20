/// @description Draw Stuff

draw_rectangle(start_x, start_y, end_x, end_y, false);

// Draw graphics to represent positions of stuff

// Draw order will affect which sprites appear
// on top of each other so put the ones you want
// on top at the bottom
render_instances(obj_npc, spr_cursor);
render_instances(obj_enemy, spr_enemy, 15, 15);
render_instances(obj_player, spr_cursor);
render_instances(obj_item, spr_item);