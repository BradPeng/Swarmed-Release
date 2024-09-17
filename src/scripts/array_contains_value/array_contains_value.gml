// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_contains_value(_arr, _value){
	for (var _i = 0; _i < array_length(_arr); _i++) {
        if (_arr[_i] == _value) {
            return true; // Value found in the array
        }
    }
    return false; // Value not found in the array
}