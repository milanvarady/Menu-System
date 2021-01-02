/// @desc Set gp device nums
var type	= async_load[? "event_type"];
var ind		= async_load[? "pad_index"];

if (ind != undefined) {
	if (type == "gamepad discovered") {
		// Add gamepads
		
		for (var i = 0; i < 12; i++) {
			if (global.gamepads_connected[i] == undefined) {
				global.gamepads_connected[i] = ind;
				break;
			}
		}
	
		show_debug_message("Gamepad Connected: " + string(ind));
	} else {
		// Remove gamepads
		
		var pos = arrayFind(global.gamepads_connected, ind);
		global.gamepads_connected[pos] = undefined;
		
		show_debug_message("Gamepad Disconnected: " + string(ind));
	}
}

/// !!! add documentation



