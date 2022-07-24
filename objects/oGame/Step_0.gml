///@desc React menu settings changes

if global.settings.audio_master != audio_get_master_gain(0) {
	audio_master_gain(global.settings.audio_master)	
}

if global.settings.window_mode != window_get_fullscreen() {
	window_set_fullscreen(global.settings.window_mode)	
}