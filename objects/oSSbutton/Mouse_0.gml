if oSSbackgrown.image_index == 0 and mouse_check_button_pressed(mb_left){
	oSSbackgrown.image_index = 1;
}else if oSSbackgrown.image_index == 1 and mouse_check_button_pressed(mb_left){
	room_goto(rmTestingRoom);
}