/// @desc Run button functions

#region Change actual values !!!

audio_master_gain(global.settings.audio_master);
if (global.settings.window_mode != window_get_fullscreen()) window_set_fullscreen(global.settings.window_mode);

#endregion

// Create input
in = in_sys.check(0);

#region Pause

if (pause_enabled) {
	if (in.pause.pressed and !inputting) {
		paused = !paused;
		
		if (paused) pauseGame();
		else resumeGame();
	}
}

#endregion

if (!menu_enabled) exit;

#region Run menu extension step

if (menu_extension != undefined and is_struct(menu_extension)) {
	if (variable_struct_exists(menu_extension, "step")) {
		if (is_method(menu_extension.step)) menu_extension.step();
	}
}

#endregion

// Exit if page is empty
if (getlen(page) == 0) exit;

// Get array length 
var back = !ds_stack_empty(prev_pages);
var num = getlen(page) + back;

#region Switch buttons

// Get horizontal and vertical inputs
hinput			= in.right.down - in.left.down;
hinput_pressed	= in.right.pressed - in.left.pressed;
vinput			= in.down.pressed - in.up.pressed;

// Change option
if (vinput != 0 and !inputting) {
	menu_option += vinput;

	// Keep in range
	if (menu_option < 0) menu_option = num-1;
	if (menu_option > num - 1) menu_option = 0;
	
	// Sound
	sn = audio.move;
}

#endregion

#region Run button functions

for (var i = 0; i < num; i++) {
	var pressed = in.enter.pressed and menu_option == i;
	var on_back_button	= back and i == num - 1;
	var sel = i == menu_option;
	
	if (!on_back_button) {
		// Normal button
		var arr = page[i];
		
		var item = pageFind(arr).item;
		
		if (is_array(item)) {
			// If page transfer button
			if (pressed) {
				gotoPage(arr[e_menu_element.val]);
				break;
			}
		} else {
			// Page before
			var page_before = page;
			
			// Run on select
			if (sel and variable_struct_get(item, "on_select") != undefined) item.on_select();
	
			// Run on press
			if (pressed) {
				if (variable_struct_get(item, "on_press") != undefined) item.on_press();
			}
			
			// Break if menu page has changed
			if (page != page_before) {
				delete page_before;
				break;
			}
			
			delete page_before;
		}
	} else {
		// Back button
		if ((pressed) or (in.back.pressed and !inputting)) {
			gotoPrevPage();
		}
	}
}

#endregion

// Play sound
if (sn != undefined) audio_play_sound(sn, 5, false);
sn = undefined;