//make a platformer character speedrun world record

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

//shooting
aim_dir = image_xscale;
can_shoot = 0;
fire_rate = 30;

//health
hp = 10;
hit_flash = 0;

//check for perks that need to be checked in here
//because some'll probably not need to be checked constantly
if players[player_id][3][0] == "highjump"
jump_force = -20;
