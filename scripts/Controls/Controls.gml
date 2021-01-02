/// @func Controls(input_system, [order])

/// @desc Automatically creates a controls menu based on an input system

/// @param {struct} 	input_system	The input system used
/// @param {string}		[filename]		Save file name, or false if you don't want to save the inputs. (default: false)
/// @param {array}		[order]			(optional) Order of inputs (e.g. ["right", "left", "jump")

/// @returns {struct}

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
	
	last_input = undefined;
	max_input_text_max = sec(1);
	max_inputs_text = -1;
	max_inputs_alpha = 0;
	
	static step = function() {
		var num = getlen(names);
		
		// If on back button exit
		if (oMenu.menu_option >= num) exit;
		
		// Get last input
		var input = inputLast();
		
		// Check if its the same as last step
		in = input != last_input and input != undefined ? input : undefined;
		
		#region Add inputs
		
		if (in != undefined) {
			if (in == vk_enter) {
				// Set inputting
				with (oMenu) {
					inputting = !inputting;
					sn = audio.shift;
				}
			} else {
				#region Add and clear inputs
				
				if (oMenu.inputting) {
					name = names[oMenu.menu_option];
					var arr = inputs[$ name];
					var arr_len = getlen(arr);
				
					switch (in) {
						default:
							// Remove if pressed again
							// if (contains(arr, in)) {
							// 	var pos = arrayFind(inputs[$ name], in);
							// 	array_delete(inputs[$ name], pos, 1);
							// 	break;
							// }
							
							if (getlen(arr) >= (oMenu.item_look.controls.max_inputs)) {
								// Show message: "Input limit reached!"
								max_inputs_text = max_input_text_max;
							} else {
								// Add input to array
								if (!contains(arr, in)) {
									array_push(inputs[$ name], in);
								}
							}
							break;
					
						case vk_backspace:
						case vk_delete:
							// Clear input array
							inputs[$ name] = [];
							break;
					}
				}
				
				#endregion
			}
		}
		
		#endregion
		
		last_input = input;
	}
	
	// Draw texts to bottom
	static draw = function() {
		max_inputs_alpha = max_inputs_text < 1 ? max_inputs_alpha - 0.05 : 1;
		
		var look	= oMenu.item_look.controls.bottom_text
		var buf		= look.distance_from_side;
		var yy		= gui_h - buf;
		var col		= look.col;
		var scale	= look.scale;
		
		drawSetText(col, look.font, fa_left, fa_middle);
		drawText(16, yy, "Press ENTER to add inputs. Press DELETE to clear them.", scale, false);
		
		draw_set_halign(fa_right);
		draw_set_alpha(max_inputs_alpha);
		drawText(gui_w - buf, yy, "Input limit reached!", scale, false);
		draw_set_alpha(1);
		
		
		max_inputs_text--;
	}
	
	static cleanup = function() {
		in_sys.save(filename);
	}

	// Set self as menu extension
	static on_press = function() {
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
		
		// Set last input to enter so it does not
		// switch to inputting after page shift
		last_input = vk_enter;
		
		#endregion
	}
}

#region Input Costructor (system)

// This constructor is needed by the system, you don't have to do anything with it!

/// @func Input(arr)

/// @param inputs
/// @param name

/// @returns {struct}

function Input(inputs, name) : MenuElement() constructor {
	self.inputs = inputs;
	self.name = name;
				
	static draw = function(x, y) {
		var arr = inputs[$ name];
		
		var arr_len = getlen(arr);
		var look = oMenu.item_look.controls.icon;
		
		// Draw rectangle if inputting
		if (oMenu.inputting) {
			var c = oMenu.col.dkunsel_selint.c1;
			
			if (c == oMenu.look.col.selected.intense) {
				var buff = oMenu.look.pos.buffer;
				
				draw_set_color(oMenu.look.col.selected.intense);
				draw_set_alpha(0.4);
				
				// Draw rectangle
				draw_rectangle(x - 6, y - buff.y / 2, gui_w - buff.x, y + buff.y / 2, false);
				
				draw_set_alpha(1);
			}
		}
		
		// Draw icon or empty text
		if (arr_len > 0) {
			// Icon
			for (var i = 0; i < arr_len; i++) {
				var in = arr[i];
				
				drawInput(x, y, in, look.txt.font, look.scale, look.highlight_col, look.replace_col, look.txt.scale, true);
				x += look.x_buffer;
			}
		} else {
			// Empty text
			drawText(x, y, "- EMPTY -", oMenu.look.txt.normal.right_scale, false);
		}
	}
}

#endregion