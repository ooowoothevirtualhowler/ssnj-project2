/// @description Init

// TODO: Rework to show collected items

num_items = 33;

padding = 5;

num_cols = 4;
num_rows = ceil(num_items / num_cols);

rect_xscale = (obj_item.sprite_width + padding) * num_rows;
rect_yscale = (obj_item.sprite_height + padding) * num_cols;