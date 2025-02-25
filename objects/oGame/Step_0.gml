//players choose skin

if room == rMainMenu {

	var _gp_num = gamepad_get_device_count();

	for (var i = 0; i < _gp_num; i++;)
	{
	    if (gamepad_is_connected(i))
	    {
			
			var _hdir = gamepad_button_check_pressed(i, gp_shoulderr)-gamepad_button_check_pressed(i, gp_shoulderl);
			
			players[i][1] += _hdir;
			
			if players[i][1] > array_length(player_skins)-1
			players[i][1] = 0;
			if players[i][1] < 0
			players[i][1] = array_length(player_skins)-1;
	    }
	}
	
}