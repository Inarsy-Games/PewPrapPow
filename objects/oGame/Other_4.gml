if instance_exists(oSpawnPoint) {
	create_players();
	instance_create_depth(x, y, depth, oWeaponSpawner);
}