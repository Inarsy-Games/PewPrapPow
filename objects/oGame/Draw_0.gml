if transition {
	
	var _col = c_black;
	draw_rectangle_color(0, room_height, room_width, trans_y, _col, _col, _col, _col, false);
	
	if changed_room <= 0
	trans_y = approach(trans_y, 0, 10);
	else if changed_room >= 60 {
		trans_y = approach(trans_y, room_height, 10);
		
		if trans_y == room_height
		transition = false;
	}
	
	//show players scores
	if trans_y == 0 {
		
		if changed_room <= 0
		room_goto(levels[irandom_range(0, array_length(levels)-1)]);
		
		changed_room += 1;
		
		var _spacing = sprite_get_width(sPlayer1)*2;
		for (var i = 0; i < array_length(players)-1; i++) {
			
			if players[i][0] != -1 {
				var _x = room_width/2 - _spacing*2 + _spacing*i;
			    draw_sprite(player_skins[players[i][1]], 0, _x, room_height/2);
				draw_text(_x, room_height/2, players[i][2]);
			}
		}
	}
	
}