//make a platformer character speedrun world record

//inputs
hdir = 0;
jump_held = 0;
jump_pressed = 0;
shoot = 0;

//movement
hsp = 0;
vsp = 0;
walk_spd = 5;
acc = 0.5;
jump_force = -8;
grv = 0.5;
max_vsp = 9;
varjumpmod = 0.7;
jump = 0;
grounded = 0;
coyote_buffer = 7;
jump_buffer = 8;
jumped = false;

colider_width = 0;
colider_height = 0;
alarm[0] = 1; //because there isnt a sprite to check when created

//shooting
aim_dir = image_xscale;
can_shoot = 0;
fire_rate = 30;
bullet_speed = 12;
recoil = 5;

//health
hp = 5;
hit_flash = 0;

//check for perks that need to be checked in here
//because some'll probably not need to be checked constantly
//if players[player_id][3][0] == "highjump"
//jump_force = -20;

draw_angle = 0;
wiggle = 5;

show_flash = 0;
flash_angle = 0;

//functions because i use the code multiple times
function draw_player() {
	draw_sprite_ext(sprite_index, image_index, x, y, sign(image_xscale), 1, draw_angle, c_white, 1);
}