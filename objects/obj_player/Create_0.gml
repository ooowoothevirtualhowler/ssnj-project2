/// @description Init

// Inherit the parent event
event_inherited();

// extra padding so we don't get stuck
wall_padding = 15;

// Weapon
weapon = noone;
weapon_out = false;

// TODO: These should maybe be defined by the weapon itself?
weapon_cooldown = 15;

weapon_offset_horizontal_x = 135;
weapon_offset_horizontal_y = 50;

weapon_offset_vertical_y = 150;

// Inventory
max_items = 15;

inventory = array_create(0);

// Orientation
up = false;
down = true; // player sprite starts facing down
left = false;
right = false;
