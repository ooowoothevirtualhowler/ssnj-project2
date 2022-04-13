function inventory_search(item, check_for_player = true) {
	if check_for_player and !instance_exists(obj_player)
		return -1;
	
	for (var i = 0; i < array_length(obj_player.inventory); i++) {
		var array_item = array_get(obj_player.inventory, i);
		
		// We need to use an object field to compare
		// so let's use the name
		if array_item.item_name == item.item_name {
			return i;
		}
	}
	return -1;
}

enum ItemAddErrorCodes {
	NoPlayer,
	InventoryFull,
	AlreadyHasItem,
	Success
}

function inventory_add(item) {
	if !instance_exists(obj_player)
		return ItemAddErrorCodes.NoPlayer;
	
	var slot = inventory_search(item, false);
	
	if inventory_full() {
		return ItemAddErrorCodes.InventoryFull;
	} else if slot != -1 {
		return ItemAddErrorCodes.AlreadyHasItem;
	} else {
		array_push(obj_player.inventory, item);
		if instance_exists(obj_gui_main)
			obj_gui_main.compute_inventory();
		return ItemAddErrorCodes.Success;
	}
}

enum ItemRemoveErrorCodes {
	NoPlayer,
	NoItem,
	Success
}

function inventory_remove(item) {
	if !instance_exists(obj_player)
		return ItemRemoveErrorCodes.NoPlayer;
	
	var slot = inventory_search(item, false);
	
	if slot == -1 {
		return ItemRemoveErrorCodes.NoItem;
	} else {
		array_delete(obj_player.inventory, slot, 1);
		if instance_exists(obj_gui_main)
			obj_gui_main.compute_inventory();
		return ItemRemoveErrorCodes.Success;
	}
}

function inventory_full() {
	return array_length(obj_player.inventory) + 1 > obj_player.max_items;
}