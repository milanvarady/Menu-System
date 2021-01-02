/// @func MenuElement()

/// @desc Parent constructor of all other elements

/// @returns {struct}

function MenuElement() constructor {
	/// @func setSettingsValue(value_key, val)
	/// @param {string} value_key
	/// @param {real}	val
	/// @returns {undefined} N/A
	
	static setSettingsValue = function(value_key, val) {
		global.settings[$ value_key] = roundToN(val, 2);
	}
	
	/// @func moveSettingsValue(amount, range_arr, sound)
	/// @param {real}	amount
	/// @param {array}	range_arr
	/// @param {sound}	[sound]
	/// @returns {undefined} N/A
	
	static moveSettingsValue = function(amount, range_arr, sound) {
		var new_val = val + amount;
		
		if (amount != 0) {
			if (inRange(new_val, range_arr[0], range_arr[1]) and sound != undefined) oMenu.sn = sound;
			
			
			val = clamp(new_val, range_arr[0], range_arr[1]);
			setSettingsValue(save_key, new_val);
		}
	}
}