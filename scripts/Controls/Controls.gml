/// @func Controls(input_system, [order])

/// @desc Automatically creates a controls menu based on an input system

/// @param {struct} 	input_system	The input system used
/// @param {string}		[filename]		Save file name, or false if you don't want to save the inputs. (default: false)
/// @param {array}		[order]			(optional) Order of inputs, because structs doesn't save their elements in order (e.g. ["right", "left", "jump")

/// @return {struct}

/// @example new Controls(global.player_input_system, "input_save.json", ["right", "left", "jump"])

function Controls(input_system, filename, order) : MenuElement() constructor {
	if (filename == undefined) filename = false;
	
	// Setup
	arr = [];
	in_sys = input_system;
	self.filename = filename;
	
	// Load inputs
	in_sys.load(filename);
	
	inputs = in_sys.inputs;
	
	// Set names
	names = order != undefined ? order : variable_struct_get_names(inputs);
	
	// Extend input arrays
	var max_inputs = oMenu.item_look.controls.max_inputs - 1;
	
	for (var i = 0; i < getlen(names); i++) {
		var name = names[i];
		
		if (getlen(inputs[$ name]) < max_inputs) inputs[$ name][max_inputs] = 0;
	}
	
	last_input = undefined;
	end_inputting = false;
	
	static step = function() {
		var num = getlen(names);
		
		// If on back button exit
		if (oMenu.menu_option >= num) exit;
		
		// Get last input
		var input = inputLast();
		
		// Check if its the same as in last step
		in = input != last_input and input != undefined ? input : undefined;
		
		// Change columns
		var hin = oMenu.hinput_pressed;
		
		if (hin != 0 and !oMenu.inputting and !end_inputting) {
			var max_inputs = oMenu.item_look.controls.max_inputs - 1;
			
			if (inRange(oMenu.in_column + hin, 0, max_inputs)) oMenu.sn = oMenu.audio.shift;
			
			oMenu.in_column = clamp(oMenu.in_column + hin, 0, max_inputs);
		}
		
		var enter = oMenu.in.enter.pressed;
		
		#region Add and remove inputs
		
		var name = names[oMenu.menu_option];
		var column = oMenu.in_column;
		end_inputting = false;
		
		if (!oMenu.inputting) {
			if (enter) {
				// Enter inputting
				oMenu.inputting = true;
				with (oMenu) sn = audio.shift;
			} else if (inputCheck([vk_backspace, vk_delete, gp_b], true) and inputs[$ name][column] != 0) {
				// Delete inputs
				inputs[$ name][column] = 0;
				oMenu.in.back.pressed = false;
			}
		} else if (keyCheck(vk_escape, true)) {
			// Escape inputting
			end_inputting = true;
		} else {
			// Add inputs
			if (in != undefined) {
				inputs[$ name][column] = in;
				end_inputting = true;
				with (oMenu) sn = audio.shift;
			}
		}
		
		#endregion
		
		last_input = input;
	}
	
	static draw = function() {
		if (end_inputting) oMenu.inputting = false;
	}
	
	static cleanup = function() {
		// Save inputs
		in_sys.save(filename);
	}
	
	static on_press = function() {
		// Set self as menu extension
		oMenu.menu_extension = self;
		
		#region Create menu page for menu obj
		
		// Create empty page
		var page = array_create(getlen(names));
		
		// Populate page
		var len = getlen(names);
		
		for (var i = 0; i < len; i++) {
			var name = names[i];
			var arr = inputs[$ name];
			
			page[i] = [name, new oMenu.Input(inputs, name)]
		}
		
		// Set page
		gotoPage(page);
		
		// Delete page
		delete page
		
		#endregion
	}
}

#region Input Costructor (system)

// This constructor is needed by the system, you don't have to do anything with it!

/// @func Input(arr)

/// @param inputs
/// @param name

/// @return {struct}

function Input(inputs, name) : MenuElement() constructor {
	self.inputs = inputs;
	self.name = name;
				
	static draw = function(x, y, selected) {
		var arr = inputs[$ name];
		
		var arr_len = getlen(arr);
		var look = oMenu.item_look.controls.icon;
		
		// Draw icon or empty text
		x += look.x_buffer / 4;
		
		for (var i = 0; i < arr_len; i++) {
			// Selected rectangle
			var rect_look = oMenu.item_look.controls.rect;
			var spr_w = sprite_get_width(global.input_sprites.key.wide) * look.scale;
			var rect_x = x - ((rect_look.w - spr_w) / 2);
			var h_half = rect_look.h / 2;
			
			var rect = {
				x1: rect_x,
				y1: y - h_half,
				x2: rect_x + rect_look.w,
				y2: y + h_half
			}
			
			// Inner rectange
			if (selected and oMenu.in_column == i) {
				draw_set_alpha(rect_look.alpha.selected);
				draw_set_color(oMenu.inputting ? oMenu.look.col.selected.intense : oMenu.look.col.selected.normal);
				draw_roundrect(rect.x1, rect.y1, rect.x2, rect.y2, false);
			} else {
				draw_set_alpha(rect_look.alpha.unselected);
				draw_set_color(rect_look.col);
				draw_roundrect(rect.x1, rect.y1, rect.x2, rect.y2, false);
			}
			
			// Outline
			draw_set_alpha(1);
			draw_set_color(oMenu.look.col.selected.normal);
			draw_roundrect(rect.x1, rect.y1, rect.x2, rect.y2, true);
			
			// Icon
			var in = arr[i];
			
			if (in != 0 and in != undefined) {
				drawInput(x, y, in, look.txt.font, look.scale, look.highlight_col, look.replace_col, look.txt.scale, true);
			}
			
			x += look.x_buffer;
		}
	}
}

#endregion