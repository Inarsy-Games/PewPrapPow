if keyboard_check(vk_tab) {

	//pick a room
	if keyboard_check_pressed(ord("1"))
	room_goto(rMainMenu);
	if keyboard_check_pressed(ord("2"))
	room_goto(rPit1);
	
	//make and destroy players
	if mouse_check_button_pressed(mb_left) {
		if position_meeting(mouse_x, mouse_y, oPlayer) {
			instance_destroy(instance_nearest(mouse_x, mouse_y, oPlayer));	
		}
		else {
			with instance_create_depth(mouse_x, mouse_y, depth, oPlayer)
			sprite_index = sPlayer1;
		}
	}
	
	//show collisions
	if keyboard_check_pressed(ord("C"))
	show_colider = !show_colider;
	
	if keyboard_check_pressed(ord("K"))
	keyboard_controls = !keyboard_controls;
	
	if keyboard_check_pressed(ord("T"))
	no_transition = !no_transition;

	
}