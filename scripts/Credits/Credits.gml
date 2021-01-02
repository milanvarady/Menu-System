/// @func Credits(string)

/// @desc Displays a scrolling credits screen when pressed

/// @param {string} string	The string to be displayed

/// @returns {struct}

function Credits(str) : MenuElement() constructor {
	self.str = str;
	
	/*
	
	static on_select = function() {
		if (in.back.down) {
			page = "..";
			credit_y = undefined;
			layer_set_visible("title", true);
		}	
	}
		
	static draw = function() {
		with (oMenu) {
			var txt = other.str
			var txt_size = look.credits.txt_size;
			
			if (credit_y == undefined) {
				credit_y = start_y;
			
				// Hide title
				layer_set_visible("title", false);
			}
		
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_white);
		
			drawTextExt(gw/2, credit_y, txt, txt_size, txt_size, c_white);
		
			if (credit_y < -(string_height(txt)*txt_size) - 64) {
				drawTextExt(gw/2, gh/2, "And thank you for playing! :)", txt_size, txt_size, c_white);
			} else {
				credit_y--;	
			}
		
			// Press to exit text
			draw_set_color(c_red);
			draw_set_halign(fa_left);
			draw_text(16, gh, "Press Q or gamepad B to exit");
		}
	}
		
	*/
}