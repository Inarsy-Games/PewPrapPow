vspeed += 0.2;

if place_meeting(x+hspeed, y, oWall)
hspeed *= -1;

if place_meeting(x, y+vspeed, oWall) {
	hspeed = 0;
	vspeed = 0;
}

if vspeed == 0 {
	life -= 1;
	if life <= 0
	image_index = 1;
}