//set sprites and animations

if vdir == 0
top_index = 0;
else if vdir == -1
top_index = 1;
else if vdir == 1
top_index = 2;

if place_meeting(x, y+1, oWall) {
	
	if hsp == 0 
	bottom_half = sPlayerLegs;	
	else
	bottom_half = sPlayerRun;
}
else
bottom_half = sPlayerAir;

//draw me self
draw_player();

//hit flash dawg
if hit_flash > 0 {
	
	hit_flash -= 1;
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_player();
	gpu_set_fog(false, c_white, 0, 0);
	
}

//show colider
if show_colider {
	var _col = c_green;
	draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, _col, _col, _col, _col, true);	
	
	_col = c_red;
	draw_rectangle_colour(bbox_right, bbox_bottom, x+colider_width/2, bbox_top, _col, _col, _col, _col, true);
}