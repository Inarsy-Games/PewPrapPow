//inputs
if !transition {
	hdir = gamepad_axis_value(player_id, gp_axislh);
	vdir = gamepad_axis_value(player_id, gp_axislv);
	jump_held = gamepad_button_check(player_id, gp_face1);
	jump_pressed = gamepad_button_check_pressed(player_id, gp_face1);
	spit = gamepad_button_check(player_id, gp_face3);

	if keyboard_controls { //this is a debug thing so I can test without needing a controller
		hdir = keyboard_check(ord("D"))-keyboard_check(ord("A"));	
		vdir = keyboard_check(ord("S"))-keyboard_check(ord("W"));	
		jump_held = keyboard_check(vk_space);
		jump_pressed = keyboard_check_pressed(vk_space);
		spit = keyboard_check_pressed(vk_shift);
	}
}
else {
	hdir = 0;
	jump_held = 0;
	jump_pressed = 0;
	spit = 0;		
}

//deadzone
if hdir > -0.25 and hdir < 0.25
hdir = 0;
if vdir > -0.25 and vdir < 0.25
vdir = 0;

//spiting
if sign(hdir) != 0
aim_dir = sign(hdir);

can_spit -= 1;
if spit and can_spit <= 0 {
	
	//make as many bullets as bullets_per_shot says
	for(var i = 0; i < bullets_per_shot; i++) {
		with instance_create_depth(x, y-sprite_height/2, depth+1, bullet_type) {
			
			//set direction
			if other.aim_dir == 1 {
				direction = 0;	
			}
			else if other.aim_dir == -1 {
				direction = 180;	
			}
			
			if other.angle_range != -1
			direction += irandom_range(other.angle_range[0], other.angle_range[1]);
			
			if other.bullet_type == oBullet
			image_angle = direction;
			
			//set speed
			speed = other.bullet_speed
			
			//set life
			if other.bullet_life != -1
			life = other.bullet_life;
			
			//set damage
			dmg = other.bullet_damage; 
			
			//set the id of the player that created the bullet
			players_id = other.player_id;
		}
	}
	
	//fire rate
	if fire_rate != -1
	can_spit = fire_rate;
	
	//recoil
	if recoil != -1
	hsp += recoil*-aim_dir;
	
	//anim stuff
	show_flash = flash_dur;
	flash_angle = irandom_range(-180, 180);
	
	//decrease ammo and revert to pistol if runs out of ammo
	ammo -= 1;
	if gun != sPistol and ammo <= 0 {
		gun = sPistol;
		set_stats(gun);
	}
	
}

//move
hsp = approach(hsp, hdir*walk_spd, acc);

//gravity
if vsp < max_vsp
vsp += grv;

//jump
grounded -= 1;
jump -= 1;

if place_meeting(x, y+1, oWall) 
grounded = coyote_buffer;
if jump_pressed
jump = jump_buffer;

if grounded > 0 and jump > 0 {
	vsp = jump_force;
	grounded = 0;
	jump = 0;
	jumped = true;
}

if !jump_held and jumped and vsp < 0 
vsp *= varjumpmod;

if vsp > 0
jumped = false;

//make slimmer while jumping to make it easier and junk you know?
if jumped {
	image_xscale = 0.25 * -aim_dir;	
}
else {
	image_xscale = -aim_dir;	
}



//collision
if place_meeting(x+hsp, y, oWall) {
	while !place_meeting(x+sign(hsp), y, oWall) {
		x += sign(hsp);	
	}
	hsp = 0;
}
x += hsp;
x = round(x);

var _wall = collision_rectangle(bbox_right, bbox_bottom, (x+colider_width/2)-1, bbox_top, oWall, false, false);
if _wall != noone
x = _wall.bbox_left-colider_width/2;
_wall = collision_rectangle(bbox_left, bbox_bottom, (x-colider_width/2) + 1, bbox_top, oWall, false, false);
if _wall != noone
x = _wall.bbox_right+colider_width/2;

if place_meeting(x, y+vsp, oWall) {
	while !place_meeting(x, y+sign(vsp), oWall) {
		y += sign(vsp);	
	}
	vsp = 0;
}
y += vsp;
y = round(y);

//check for bullet hitting you
//doing it here because the collision box changes dunt it
var _bullet = collision_rectangle(x-colider_width/2, y-colider_height, x+colider_width/2, y, oBullet, false, true);
if _bullet != noone {
	if _bullet.players_id != player_id {
		hit_flash = 5;
		hp -= _bullet.dmg;
		instance_destroy(_bullet);
	}
}

//perish
if hp <= 0
instance_destroy(id);

//animations
if hsp != 0 
image_xscale = -sign(hsp);

/*

if !place_meeting(x, y+1, oWall)
sprite_index = sPlayerSquat;
else {
	if hsp != 0
	sprite_index = sPlayerRun;
	else
	sprite_index = sPlayer;
}