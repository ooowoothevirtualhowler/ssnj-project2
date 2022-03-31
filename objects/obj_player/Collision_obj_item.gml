/// @description Get Item

text_inst = instance_create_layer(other.x, other.y, "Instances", obj_text_spawner);
text_str = "You got " + other.item_name + ".";
InventoryAdd(obj_gui_inventory.id, other.type_value);
text_destroy_after = 180;
with text_inst {
	text_to_draw = other.text_str;
	destroy_after = other.text_destroy_after;
}

instance_destroy(other.id);
