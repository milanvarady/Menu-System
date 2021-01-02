/// @func sec(seconds)

/// @desc Converts seconds to frames
// Useful when dealing with cooldowns

/// @param {real} seconds Senconds to conver to to frames

/// @returns {real} Frames

function sec(seconds) {
	return seconds * game_get_speed(gamespeed_fps);
}