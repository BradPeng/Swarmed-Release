// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function use_item_bomb(){
	if (global.player_ammo[ITEM.BOMB] > 0 and global.i_lifted == noone) {
		global.player_ammo[ITEM.BOMB]--;
		var _x = 0
		var _y = 0
		switch (CARDINAL_DIR) {
			case 0:
				_x = 15
				break;
			case 1:
				_y = -20
				break
			case 2:
				_x = -15
				break;
			case 3:
				_y = 5
				break;
		}
		var _bomb = instance_create_layer(x +_x, y + _y, "Instances", obj_bomb);
		activate_liftable(_bomb);
	}	
}