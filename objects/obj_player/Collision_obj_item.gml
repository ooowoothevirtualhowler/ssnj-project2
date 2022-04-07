/// @description Get Item

if !other.for_inventory {
	create_text(other.x, other.y, "You got " + other.item_name + ".", 180);

	instance_destroy(other.id);
}
