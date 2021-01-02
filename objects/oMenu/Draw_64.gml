/// @desc Drawing

if (!global.menu_enabled) exit;

// Get gui width and height
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Set font
draw_set_font(fBigPixel);

// Get array length 
var back = !ds_stack_empty(prev_pages);
var num = getlen(page) + back;

// Check for sidebar menu items
var sidebar = false;

for (var i = 0; i < num; i++) {
	var on_back_button = back and i == num - 1;
	
	if (!on_back_button) {
		var arr = page[i];
		var strc = findStruct(arr);
		
		if (strc != undefined) {
			if (contains(sidebar_elements, instanceof(strc))) {
				sidebar = true;
				break;
			}
		}
	}
}

// Create animation array
var anim_type = sidebar ? e_anim_type.sidebar : e_anim_type.button;

if (getlen(anim_array) == 0) {
	anim_array = array_create(num);
	
	for (var i = 0; i < num; i++) {
		anim_array[i] = new ButtonAnimation(anim_type);
	}
}

// Set draw pos
var start_x = gw/2 + look.pos.menu_offset.x;
var start_y = (gh/2) - ((((num - 1) / 2) * look.pos.buffer.y)) + (look.pos.menu_offset.y);
var menu_h	= (look.pos.buffer.y * (num-1));

var xx = start_x;
var yy = start_y;

// Run background task and adjust position
if (menu_extension != undefined and is_struct(menu_extension)) {
	if (variable_struct_exists(menu_extension, "draw")) {
		if (is_method(menu_extension.draw)) menu_extension.draw();
	}
	
	if (instanceof(menu_extension) == "Controls") {
		start_x += item_look.controls.x_offset;
	}
}

// Main drawing loop
for (var i = 0; i < num; i++) {
	var on_back_button	= back and i == num-1;
	var arr = !on_back_button ? page[i] : [item_look.back_button.name];
	
	// Animation
	var anim_pos = 0;
	
	if ((sidebar and anim.sidebar.anim_on) or (!sidebar and anim.button.anim_on)) {
		anim_array[i].step(menu_option == i);
		anim_pos = anim_array[i].pos;
	}
		
	if (is_array(arr)) {
		var y_buff = sidebar ? look.pos.buffer.y : item_look.button.y_buffer;
		var x_buff = look.pos.buffer.x;
		
		// Get name
		var name = stringRemoveUderscore(arr[e_menu_element.name]);
		
		// Pos
		yy = start_y + (y_buff * i);
		var sel = menu_option == i;
		
		// Set color
		col = {
			unsel_sel:		col2(sel, look.col.unselected.normal,	look.col.selected.normal),
			dkunsel_selint:	col2(sel, look.col.unselected.dark, 	look.col.selected.intense)
		}
		
		if (!sidebar) {
			// Draw buttons
			xx = gw/2;
			yy += anim_pos;
			drawButton(xx, yy, name);
		} else {
			// Draw evertything else
			
			// Draw names at left side
			xx = start_x - x_buff - anim_pos;
			drawSetText(col.unsel_sel.c1, look.txt.normal.font, fa_right, fa_center)
			drawText(xx, yy, name, look.txt.normal.scale, look.txt.normal.outline_on ? col.unsel_sel.c2 : false);
			
			// Draw line in the middle
			draw_set_color(item_look.div_line.col);
			draw_line(start_x, start_y - y_buff, start_x, start_y + menu_h + y_buff);
			
			// Run draw at right side
			draw_set_halign(fa_left)
			xx = start_x + x_buff;
			var strc = findStruct(arr);
			
			// Set color to intense if inputting
			if (inputting and menu_option == i) col.unsel_sel.c1 = look.col.selected.intense;
			
			if (strc != undefined) {
				if (variable_struct_get(strc, "draw") != undefined) strc.draw(xx, yy);
			}
		}
	}
}