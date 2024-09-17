function save_game() {
    ini_open("save.ini");

    ini_write_real("Player", "Money", global.player_money);

    ini_write_real("Player", "HighScore", global.high_score);

    ini_write_real("Upgrades", "Count", array_length(global.permanent_upgrades));
    for (var _i = 0; _i < array_length(global.permanent_upgrades); _i++) {
        var _upgrade = global.permanent_upgrades[_i];
        ini_write_string("Upgrade" + string(_i), "Name", _upgrade.name);
        ini_write_real("Upgrade" + string(_i), "Cost", _upgrade.cost);
        ini_write_real("Upgrade" + string(_i), "Level", _upgrade.level);
    }

    ini_close();

    show_debug_message("Game Saved to ini file.");
}