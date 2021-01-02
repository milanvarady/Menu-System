/// @desc Logics

if (!global.menu_enabled) exit;

// Create input
in = in_sys.check(0);

// Run background task
if (menu_extension != undefined and is_struct(menu_extension)) {
	if (variable_struct_exists(menu_extension, "step")) {
		if (is_method(menu_extension.step)) menu_extension.step();
	}
}

// Get array length 
var back = !ds_stack_empty(prev_pages);
var num = getlen(page) + back;

// Get horizontal and vertical inputs
hinput			= in.right.down - in.left.down;
hinput_pressed	= in.right.pressed - in.left.pressed;
vinput			= in.down.pressed - in.up.pressed;

// Change option
if (vinput != 0 and !inputting) {
	menu_option += vinput;

	// Keep in range
	if (menu_option < 0) menu_option = num-1;
	if (menu_option > num-1) menu_option = 0;
	
	// Sound
	sn = audio.move;
}

// Interate through array
for (var i = 0; i < num; i++) {
	var pressed = in.enter.pressed and menu_option == i;
	var on_back_button	= back and i == num - 1;
	var sel = i == menu_option;
	
	if (!on_back_button) {
		// Normal button
		var arr = page[i];
		var strc = findStruct(arr);
		
		if (strc == undefined) {
			// If page transfer button
			if (pressed) {
				gotoPage(arr[e_menu_element.val]);
				break;
			}
		} else {
			// Run on select
			if (sel and variable_struct_get(strc, "on_select") != undefined) strc.on_select();
	
			// Run on press
			if (pressed) {
				if (variable_struct_get(strc, "on_press") != undefined) strc.on_press();
			}
		}
	} else {
		// Back button
		if ((pressed) or (in.back.pressed and !inputting)) {
			// Go back
			var arr = ds_stack_pop(prev_pages);
			page = arr[0];
			menu_option = arr[1];
			
			sn = audio.back;
			
			// Call menu extension cleanup
			if (menu_extension != undefined) {
				if (variable_struct_exists(menu_extension, "cleanup")) {
					if (is_method(menu_extension.cleanup)) menu_extension.cleanup();
				}
			}
			
			// Reset stuff
			menu_extension = undefined;
			anim_array = [];
			scrolling_y = undefined;
			
			// Save
			saveToJson(global.settings, save_filename);
		}
	}
}

if (sn != undefined) audio_play_sound(sn, 5, false);
sn = undefined;