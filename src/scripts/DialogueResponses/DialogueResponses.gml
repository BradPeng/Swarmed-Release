// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialogue_responses(_response){
	switch (_response) {
		case 0: break
		// open shop
		case 8:
			open_shop()
			break;
		case 9: // leave shop
			new_text_box("Okay bye", 2) break; 
		
			
		default: break;
	
	}
}