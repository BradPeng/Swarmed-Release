function load_game() {
    if (file_exists("save.ini")) {
        ini_open("save.ini");

        global.player_money = ini_read_real("Player", "Money", 0);

        global.high_score = ini_read_real("Player", "HighScore", 0);

        var _upgrade_count = ini_read_real("Upgrades", "Count", 0);
        global.permanent_upgrades = [];
        
        for (var _i = 0; _i < _upgrade_count; _i++) {
            var _upgrade_name = ini_read_string("Upgrade" + string(_i), "Name", "");
            var _upgrade_cost = ini_read_real("Upgrade" + string(_i), "Cost", 0);
            var _upgrade_level = ini_read_real("Upgrade" + string(_i), "Level", 0);
            
            var _upgrade = {
                name: _upgrade_name,
                cost: _upgrade_cost,
                level: _upgrade_level
            };
            
            array_push(global.permanent_upgrades, _upgrade);
        }

        ini_close();

        show_debug_message("Game Loaded from ini file.");
    } else {
        show_debug_message("No save file found.");
    }
}
