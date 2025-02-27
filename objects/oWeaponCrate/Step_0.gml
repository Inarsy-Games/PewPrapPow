//gravity
vspeed += grv;

//spawn the weapon
if place_meeting(x, y+vspeed, oWall) {
	with instance_create_depth(x, y, depth, oWeaponPickup) {
		sprite_index = other.weapon;	
	}
	
	instance_destroy(id);
}