draw_player();

//hit flash dawg
if hit_flash > 0 {
	
	hit_flash -= 1;
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_player();
	gpu_set_fog(false, c_white, 0, 0);
	
}

//draw da gun
draw_sprite_ext(sGun, 0, x+aim_dir*16, y-sprite_height/2, -aim_dir, 1, 0, c_white, 1);

//show colider
if show_colider {
	var _col = c_green;
	draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, _col, _col, _col, _col, true);	
	
	_col = c_red;
	draw_rectangle_colour(bbox_right, bbox_bottom, x+colider_width/2, bbox_top, _col, _col, _col, _col, true);
}
