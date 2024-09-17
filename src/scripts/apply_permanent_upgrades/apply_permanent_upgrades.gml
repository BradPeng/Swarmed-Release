// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_permanent_upgrades(){
	var _upgrades = global.permanent_upgrades
	for (var _i = 0; _i < array_length(_upgrades); _i++) {
	    var _upgrade = _upgrades[_i];

	    switch (_upgrade.name) {
	        case "Damage":
	            global.player_damage_bonus = _upgrade.level ; // +1 damage per level
	            break;
			case "Maximum Health":
				global.player_max_health_bonus = _upgrade.level * 20 //20 hp per level
				break;
	        case "Health Regen":
	            global.player_health_regen = _upgrade.level * 0.25; //  +0.25 HP regen per level
	            break;
	        case "Pickup Radius":
	            global.player_pickup_radius_bonus = _upgrade.level * 10; //+10 pickup radius per level
	            break;
			case "Area Size":
				global.player_area_size_bonus_percent = _upgrade.level * 10
				break;
			case "Projectiles":
	            global.player_projectile_bonus = _upgrade.level; //+1 projectile per level
	            break; 
			case "XP":
	            global.player_xp_bonus_percent = _upgrade.level  * 10; //+10% xp per level
	            break; 
			case "Back Shots":
	            global.player_back_shot = _upgrade.level; //+1 backshot per level
	            break; 
	    }
	}
}