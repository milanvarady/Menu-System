/// @func loadFromJson(filename)

/// @desc Loads json file and turns it into struct and array nested data structure

/// @param {string} filename	The file to load

/// @returns {struct/array}

function loadFromJson(filename) {
	var str = loadStringFromFile(filename);
	
	return is_string(str) ? json_parse(str) : {};
}