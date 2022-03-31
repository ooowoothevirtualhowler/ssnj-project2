/// @description Init

// TODO: Rework to show collected items
/*
num_items = 33;

padding = 5;

num_cols = 4;
num_rows = ceil(num_items / num_cols);

rect_xscale = (obj_item.sprite_width + padding) * num_rows;
rect_yscale = (obj_item.sprite_height + padding) * num_cols;
*/

//Inventory Setup (Shaun S.)
#macro INVENTORY_SLOTS 8 //Number of slots in inventory
rowLength = 4; //Number of slots in a row
inventory = array_create(INVENTORY_SLOTS, -1); //Creates inventory, default entry -1
randomize(); //Randomize numbers
//inventory[0] = 0; //Three items, 2 of type 0, 1 of typr 1.
//inventory[1] = 0; //
//inventory[2] = 1; //
