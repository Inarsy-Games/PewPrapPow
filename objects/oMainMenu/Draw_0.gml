//Draw Title
draw_set_font(fEgg);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width/2, room_height/4, title);

draw_set_valign(fa_top);

//Draw Lobby
draw_text(room_width/2, room_height/2, "Players:");

var _gp_num = gamepad_get_device_count();
var _gp_connected = 0;
for (var i = 0; i < _gp_num; i++;)
{
    if (gamepad_is_connected(i))
	_gp_connected += 1;
}


if _gp_connected != 0 {

	var _spacing = sprite_get_width(sPlayer1)*2;
	for (var i = 0; i < _gp_num; i++;)
	{
	    if (gamepad_is_connected(i))
	    {
			var _x = room_width/2 - _spacing*2 + _spacing*i;
		
	        draw_sprite(player_skins[players[i][1]], 0, _x, room_height/1.25);
			draw_text(_x, room_height/1.25 + sprite_get_height(sPlayer1)/2, "P"+string(i+1));
			
			
			
	    }
	} 
	
	//start button
	if _gp_connected >= 0 {
		draw_text(room_width/2, room_height/1.25, "Press start to start");
		
		if gamepad_button_check_pressed(0, gp_start)
		room_goto(rPit1);
	}

}
else {
	draw_text(room_width/2, room_height/1.25, "Searching for gamepads...")	
}