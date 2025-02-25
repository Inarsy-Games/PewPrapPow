//inputs
hdir = gamepad_axis_value(player_id, gp_axislh);
jump_held = gamepad_button_check(player_id, gp_face1);
jump_pressed = gamepad_button_check_pressed(player_id, gp_face1);
shoot = gamepad_button_check(player_id, gp_face3);

if instance_number(oPlayer) == 1 {
	hdir = keyboard_check(ord("D"))-keyboard_check(ord("A"));	
	jump_held = keyboard_check(vk_space);
	jump_pressed = keyboard_check_pressed(vk_space);
	shoot = keyboard_check_pressed(vk_shift);
}

//shooting
if round(hdir) != 0
aim_dir = sign(hdir);

can_shoot -= 1;
if shoot and can_shoot <= 0 {
	with instance_create_depth(x+aim_dir*16, y-sprite_height/2, depth+1, oBullet)
	hspeed = other.aim_dir*other.bullet_speed;
	
	can_shoot = fire_rate;
	
	hsp += recoil*-aim_dir;
	
	//anim stuff
	show_flash = 5;
	flash_angle = irandom_range(-180, 180);
}

//move
if hdir > -0.25 and hdir < 0.25
hdir = 0;

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

var _wall = collision_rectangle(bbox_right, bbox_bottom, x+colider_width/2, bbox_top, oWall, false, false);
if _wall != noone
x = _wall.bbox_left-colider_width/2;
_wall = collision_rectangle(bbox_left, bbox_bottom, x-colider_width/2, bbox_top, oWall, false, false);
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