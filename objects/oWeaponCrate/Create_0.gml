while place_meeting(x, y, oWall) {
	x = irandom_range(0, room_width);
	y = irandom_range(0, room_height);
}

grv = 0.2;

weapons = [sLandmine, sShotgun];
weapon = weapons[irandom_range(0, array_length(weapons)-1)];