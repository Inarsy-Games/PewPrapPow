if other.gun != sprite_index {
	other.gun = sprite_index;
	
	//change players stats
	with oPlayer {
		
		set_stats(gun);
		
	}
	
	//destroy self lol hahahaha
	instance_destroy(id);
}