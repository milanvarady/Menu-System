/// @func Credits(string)

/// @desc Displays a scrolling credits screen when pressed

/// @param {string} string	The string to be displayed

/// @returns {struct}

function Credits(str) : MenuElement() constructor {
	self.str = str;
	credit_y = undefined;
	
	static on_press = function() {
		gotoPage([]);
		oMenu.menu_extension = self;
		credit_y = gui_h;
		
		with (oMenu) break;
	}
	
	static step = function() {
		if (oMenu.in.back.pressed) {
			gotoPrevPage();
		}
		
		credit_y -= oMenu.item_look.credits.scrolling_speed;
	}
		
	static draw = function() {
		var look = oMenu.item_look.credits.txt;
		
		// Draw credits text
		drawSetText(look.col, look.font, fa_middle, fa_top);
		drawText(gui_w / 2, credit_y, str, look.scale, look.outline_col);
		
		// Go back if text is no longer on the screen
		var h = string_height(str) * look.scale;
		if (credit_y + h < 0 - (gui_h * 0.2)) gotoPrevPage();
		
		// Draw go back text
		drawSetText(oMenu.look.col.selected.normal, oMenu.look.txt.small.font, fa_left, fa_bottom);
		drawText(5, gui_h - 5, "Press esc to exit", oMenu.look.txt.small.scale);
	}
}