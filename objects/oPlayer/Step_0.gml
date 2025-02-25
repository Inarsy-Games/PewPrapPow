//inputs
jump_held = gamepad_button_check(player_id, gp_face1);
jump_pressed = gamepad_button_check_pressed(player_id, gp_face1);
shoot = gamepad_button_check(player_id, gp_face3);

//shooting
if round(gamepad_axis_value(player_id, gp_axislh)) != 0
aim_dir = round(gamepad_axis_value(player_id, gp_axislh));

can_shoot -= 1;
if shoot and can_shoot <= 0 {
	with instance_create_depth(x+aim_dir*16, y-sprite_height/2, depth+1, oBullet)
	players_id = other.player_id;
	
	can_shoot = fire_rate;
}

//move
var _hdir = gamepad_axis_value(player_id, gp_axislh);
if _hdir > -0.25 and _hdir < 0.25
_hdir = 0;

hsp = approach(hsp, _hdir*walk_spd, acc);

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

//collision
if place_meeting(x+hsp, y, oWall) {
	while !place_meeting(x+sign(hsp), y, oWall) {
		x += sign(hsp);	
	}
	hsp = 0;
}
x += hsp;

if place_meeting(x, y+vsp, oWall) {
	while !place_meeting(x, y+sign(vsp), oWall) {
		y += sign(vsp);	
	}
	vsp = 0;
}
y += vsp;

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