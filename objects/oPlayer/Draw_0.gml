draw_self();

//hit flash dawg
if hit_flash > 0 {
	
	hit_flash -= 1;
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
	
}

//draw da gun
draw_sprite_ext(sGun, 0, x+aim_dir*16, y-sprite_height/2, -aim_dir, 1, 0, c_white, 1);
