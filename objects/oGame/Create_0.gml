//randomize
randomise();

//all the weapons that can spawn
globalvar weapons;
weapons = [sLandmine, sShotgun];

//player sprites
globalvar player_skins;
player_skins = [sPlayer1, sPlayer2, sPlayer3, sPlayer4, sPlayer5, sPlayer6, sPlayer7, sPlayer8];

//player data
globalvar players;
players = [

//players obj id, skin index, rounds won, perks
[-1, 0, 0, [] ],
[-1, 1, 0, [] ],
[-1, 2, 0, [] ],
[-1, 3, 0, [] ]

];

//level transition
globalvar transition;
transition = false;
changed_room = 0;
trans_y = room_height;
round_over = 0;

//levels
levels = [rPit1, rPit2];

//functions for stuff
function create_players() {
	spawn_points = ds_list_create();
	with oSpawnPoint 
	ds_list_add(other.spawn_points, id);

	ds_list_shuffle(spawn_points);

	var _gp_num = gamepad_get_device_count();

	for (var i = 0; i < _gp_num; i++;)
	{
	    if (gamepad_is_connected(i))
	    {
			var _spawn = ds_list_find_value(spawn_points, 0);
			ds_list_delete(spawn_points, 0);
		
			_player = instance_create_depth(_spawn.x, _spawn.y, depth, oPlayer);
			with _player {
				player_id = i;
				sprite_index = player_skins[players[i][1]];
			}
			
			players[i][0] = _player;
			
			//gamepad_set_axis_deadzone(i, 0.5);
		
	    }
	}
}