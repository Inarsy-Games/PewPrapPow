life -= 1;
if life <= 0 {

	instance_create_depth(x, y, depth, oWeaponCrate);
	instance_destroy(id);
	
}