// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_boss(){
	new_text_box("Who dares enter my forest?", 4)
	new_text_box("You will never leave here alive!", 4, [], spawn_boss_end_of_text_script, -1)
}

function spawn_boss_end_of_text_script() {
	instance_create_layer(114, 1008, "Instances", obj_gremlin_blue)	
}