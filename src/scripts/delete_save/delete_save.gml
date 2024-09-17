// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delete_save(){
	if (file_exists("save.ini")) {
        file_delete("save.ini");
        show_debug_message("Save file deleted.");
    } else {
        show_debug_message("No save file to delete.");
    }
}