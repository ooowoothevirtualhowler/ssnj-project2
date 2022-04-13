/// @description Get Item

if !other.for_inventory {
	ret_code = inventory_add(other);
		
	switch ret_code {
		case ItemAddErrorCodes.Success:
			create_text(other.x, other.y, "You got " + other.item_name + ".", 180);
			
			if object_get_name(other.object_index) == "obj_weapon" {
				last_index = array_length(inventory) - 1;
				weapon = array_get(inventory, last_index);
			}
			
			instance_destroy(other.id);
			break;
		case ItemAddErrorCodes.InventoryFull:
			create_text(other.x, other.y - other.sprite_height, "Couldn't get " + other.item_name + ". Inventory full.", 180);
			break;
		case ItemAddErrorCodes.AlreadyHasItem:
			create_text(other.x, other.y - other.sprite_height, "You already have " + other.item_name + ".", 180);
			break;
	}
}



