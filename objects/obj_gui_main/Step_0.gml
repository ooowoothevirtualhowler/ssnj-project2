/// @description Main Logic

key_openclose = keyboard_check_pressed(vk_space);

if key_openclose {
	if state == States.Closed {
		state = last_state;
		event_perform(ev_other, ev_user0);
	} else {
		change_state(States.Closed);
	}
}