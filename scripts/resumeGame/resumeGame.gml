function resumeGame() {
	//with (oMenu) saveGame();

	oGame.paused = false;

	instance_activate_all();
	surface_free(oGame.pause_surf);
	oGame.pause_surf = -1;
			
	audio_resume_all();
			
	// Pause out sound
	audio_play_sound(snPauseOut, 10, false);
}
