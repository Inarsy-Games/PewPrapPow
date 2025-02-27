if life <= 0 {
	instance_destroy(id);
	other.hp -= dmg;
	
	instance_create_depth(x, y, depth, oExplosionPrime);
	
}