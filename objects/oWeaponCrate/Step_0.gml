//gravity
vspeed += grv;

//spawn the weapon
if place_meeting(x, y+vspeed, oWall) {
	with instance_create_depth(x, y, depth, oWeaponPickup) {
		sprite_index = other.weapon;	
	}
	
	instance_destroy(id);
	
	//particles
	for(var i = 0; i < irandom_range(3, 5); i++) {
		instance_create_layer(x, y, "dust", oPlank);	
	}
	
}