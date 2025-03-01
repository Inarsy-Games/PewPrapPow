vspeed += 0.2;
image_angle += rot_spd;

life -= 1;

if life > 0 {
	if place_meeting(x+hspeed, y, oWall) {
		hspeed *= -1;	
		life = 0;
	}
	if place_meeting(x, y+vspeed, oWall) {
		vspeed *= -1;	
		life = 0;
	}
}