/// @description Navigate

up_key = keyboard_check_pressed(vk_up)
down_key = keyboard_check_pressed(vk_down)
accept_key = keyboard_check_pressed(vk_space)

pos += down_key - up_key;

if pos >= op_length {
	pos = 0;
}

if pos < 0 {
	pos = op_length - 1;
}

if accept_key {
switch pos {
	case 0:		
		room_goto(Room1);
		break;
		
	case 1:
		game_end();
		break;
		
	case 2:
		game_end();
		break;
	}
}