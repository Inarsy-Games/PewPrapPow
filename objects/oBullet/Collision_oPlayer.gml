if other.player_id != players_id {
	
	other.hit_flash = 5;
	other.hp -= 1;
	
	instance_destroy(id);
}