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

//shooting-

//the stats for each weapon
gun_stats = [

/*
the gun/sprite,
ammo,
bullets per shot,
bullet angle range,
recoil per shot, 
bullets speed, 
bullets life, 
fire rate 
bullet_type,
show bullet flash,
bullets damage
*/
[sPistol, -1, 1, -1, 5, 12, 20, 30, oBullet, true, 2],
[sShotgun, 4, 5, [-20, 20],12, 12, 10, 50, oBullet, true, 1],
[sLandmine, 1, 1, -1, 0, 5, 30, -1, oLandmine, false, 5]

];

//the variables for the weapon stats
ammo = -1;
bullets_per_shot = -1;
angle_range = -1;
recoil = -1;
bullet_speed = -1;
bullet_life = -1;
fire_rate = -1;
bullet_type = -1;
show_flash = false;
bullet_damage = -1;

//set your stats based on your gun
function set_stats(_gun) {
	
	//find the index for the stats
	var _stats_index = 0;
	for(var i = 0; i < array_length(gun_stats); i++) {
			
		if gun_stats[i][0] == _gun {
			_stats_index = i;
			break;
		}
			
	}
		
	//set the stats
	ammo = gun_stats[_stats_index][1];
	bullets_per_shot = gun_stats[_stats_index][2];
	angle_range = gun_stats[_stats_index][3]
	recoil = gun_stats[_stats_index][4];
	bullet_speed = gun_stats[_stats_index][5];
	bullet_life = gun_stats[_stats_index][6];
	fire_rate = gun_stats[_stats_index][7];
	bullet_type = gun_stats[_stats_index][8];
	show_flash = gun_stats[_stats_index][9];
	bullet_damage = gun_stats[_stats_index][10];
}

//other things for shooting that arent stats/parameters
gun = sPistol;
aim_dir = image_xscale;
can_shoot = 0;
set_stats(gun);

//health-
hp = 5;
hit_flash = 0;

//check for perks that need to be checked in here
//because some'll probably not need to be checked constantly
//if players[player_id][3][0] == "highjump"
//jump_force = -20;

//animation/drawing-

draw_angle = 0;
wiggle = 5;
show_flash = 0;
flash_angle = 0;
//hit flash variable is under health stuff

function draw_player() {
	draw_sprite_ext(sprite_index, image_index, x, y, sign(image_xscale), 1, draw_angle, c_white, 1);
}