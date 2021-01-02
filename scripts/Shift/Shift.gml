/// @func Shift(options, default_val, save_key)

/// @desc Shifts a value between given options. The settings struct value is ranging from 0 to number of options - 1.

/// @param {array}	options			The list of options (e.g. ["Easy", "Normal", "Hard"])
/// @param {real}	default_val		Default value if save file doesn't exists
/// @param {string} save_key		The name under the value is being stored in the settings struct

/// @returns {struct}

function Shift(options, default_val, save_key) : MenuElement() constructor {
	self.save_key	= save_key;
	val				= getSettingsValue(default_val);
	self.options	= options;
	name			= options[val];
		
	static on_select = function() {
		moveSettingsValue(oMenu.hinput_pressed, [0, getlen(options) - 1], oMenu.audio.shift);
	}
		
	static draw = function(x, y) {
		var txt = options[val];
		var left_shift = "<< ";
		var right_shift = " >>";
		var c = oMenu.col.unsel_sel.c1;
		
		if (val == 0) left_shift = "";
		if (val == getlen(options)-1) right_shift = "";
		
		draw_set_color(c);
		
		drawText(x, y, left_shift + txt + right_shift, oMenu.look.txt.normal.right_scale, false);
	}
}