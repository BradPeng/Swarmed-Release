// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function seconds_to_game_time(_total_seconds){
	// minutes
    var _minutes = floor(_total_seconds / 60);
    
	// seconds
    var _seconds = _total_seconds mod 60;
    
	// Convert to string
    var _minutes_str = string(_minutes);
    var _seconds_str = string(_seconds);
    
    if (_seconds < 10) {
        _seconds_str = "0" + _seconds_str;
    }
    
	// mm:ss format
    var _time_str = _minutes_str + ":" + _seconds_str;
    
    return _time_str;
}