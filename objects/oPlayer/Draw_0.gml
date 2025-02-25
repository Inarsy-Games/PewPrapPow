//do some wiggle
if hsp != 0 and place_meeting(x, y+1, oWall) {
	draw_angle += wiggle;
	
	var _wiggle_range = 15;
	if draw_angle > _wiggle_range or draw_angle < -_wiggle_range
	wiggle *= -1;
	
	
	//kick some dusty
	with instance_create_layer(x+hsp, y, "dust", oDust)
	hspeed = -other.hsp/random_range(3, 6);
	
}
else {
	if wiggle < 0
	wiggle *= -1;
	
	draw_angle = approach(draw_angle, 0, wiggle);	
}

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
