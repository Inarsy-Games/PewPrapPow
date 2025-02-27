for (var i = 0; i < irandom_range(3, 6); i++) {
	
	instance_create_depth(x+irandom_range(-20, 20), y+irandom_range(-20, 20), depth+choose(-1, 1), oExplosion);
	
}

image_speed = 0.5;