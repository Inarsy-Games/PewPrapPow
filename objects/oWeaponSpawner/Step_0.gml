//Spawn a weapons crate
if irandom_range(0, 100) == 69 { 
	var _xspawn = irandom_range(0, room_width);
	var _yspawn = irandom_range(0, room_height);
	instance_create_layer(_xspawn, _yspawn, "Instances", oWeaponCrate);
}

//this object is created in oGame room start