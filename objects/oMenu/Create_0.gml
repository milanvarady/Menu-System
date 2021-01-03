/// @desc Init grid and vars

#region Settings struct setup (system)

	save_filename = "menu_save.json";
	
	global.settings = loadFromJson(save_filename);

#endregion

#region Audio settings (user)

	audio = {
		press:		snButtonPress,		// Button press
		shift:		snMenuShift,		// Settings shift
		move:		snMenuMove,			// Button change
		page_shift:	snMenuPageShift,	// Page shift
		back:		snMenuBack			// Back button sound
	}

#endregion

#region Credits text (user)

var str_credits = 
	@"
Code:

Milan Varady



Art:

Milan Varady

Animals: 
@emimonserrate



Music:

Evan King
evankingmusic.com
YouTube: Evan King

TeknoAXE
YouTube: 
TeknoAXE's Royalty Free Music


And thank you for playing :)
"

#endregion

#region Look settings (user)

	// Text style, color, and position settings
	look = {
		// Text
		txt: {
			// Used when drawing most of the things
			normal: {
				font:			fPixelBig,	// Text font
				scale:			2,			// Text scale
				right_scale:	1.4,		// Right side text scale (slider, toggle...)
				outline_on:		true		// (bool) Whether the text should be outlined or not
			},
			
			// Used when drawing smaller things (e.g. Input icons)
			small: {
				font: fPixel,		// Text font
				scale: 1,			// Text scale
				outline_on:	true	// (bool) Whether the text should be outlined or not
			}
		},
		
		// Color
		col: {
			// Color used when an item is selected
			selected: {
				normal:		c_orange,	// Default color
				intense:	c_red		// More intense color
			},
			
			// Color used when an item is not selected
			unselected:	{
				normal: 	c_white,	// Default color
				dark:		c_gray		// More dark color
			}
		},
		
		// Poisition
		pos: {
			// Space between items
			buffer: {
				x:	24,		// Space between the things and the line in the middle
				y:	32,		// Space between items
			},
			
			// The whole menu's offset
			menu_offset: {
				x:	0,		// Whole menu's x offset
				y:	40		// Whole menu's y offset
			}
		}
	};
	
	// Look of idividual items
	item_look = {
		// Dividing line
		div_line: {
			col: c_white	// Color of the line
		},
		
		// Button in the middle
		button: {
			w:			256,	// Button width
			h:			40,		// Button height
			y_buffer:	52,		// Space between buttons
			roundness:	10,		// Corner roundness
			cir_prec:	24,		// Circle precision (Must be divisible by 4!)
			alpha:		0.5		// Button's alpha
		},
			
		// Toggle
		toggle: {
			buffer: 80		// Space between the ON and OFF text
		},
		
		// Slider
		slider: {
			// Line
			line: {
				w:				160,		// The width of the line
				h:				4,			// The height of the line
			},
			
			// Marker (the circle that shows the current value)
			marker: {
				rad:			4,									// Circle radius 
				circle_prec:	4,									// Circle precision (Must be divisible by 4!)
				col:			oMenu.look.col.unselected.normal	// Circle color
			}
		},
		
		// Controls
		controls: {
			x_offset: -20,		// The input menu's offset on the x-axis
			max_inputs: 4,		// Maximum number of inputs
			
			// Icon (on the right of the menu)
			icon: {
				scale:			1.4,							// Scale of the icon
				x_buffer:		60,								// Space between icons
				highlight_col:	oMenu.look.col.selected.normal,	// The color theme of the icon
				replace_col:	make_color_rgb(237, 0, 140),	// The color that is being replaced with the highlight color
				
				// Text (when drawing keys)
				txt: {
					scale:		oMenu.look.txt.small.scale + 0.4,// Text scale
					font:		oMenu.look.txt.small.font		// Text font
					
				}
			},
			
			// Text at the bottom (saying: "Press ENTER to add inputs. Press DELETE to clear them.")
			bottom_text: {
				font:				oMenu.look.txt.small.font,			// Text font
				scale:				oMenu.look.txt.small.scale,			// Text scale
				col:				oMenu.look.col.selected.normal,		// Text color
				distance_from_side: 16									// Distance from the side of the screen
			}
		},
		
		// Credits
		credits: {
			// Credits text
			txt: {
				font:			oMenu.look.txt.normal.font,			// Text font
				col:			oMenu.look.col.selected.normal,		// Text color
				scale:			oMenu.look.txt.normal.scale - 1,	// Text scale
				outline_col:	c_black								// Outline color or false if you don't want an outline
			},
			
			scrolling_speed:	1								// Text scrolling speed
		},
		
		// Back button
		back_button: {
			name: "back"	// Previous menu page button name
		}
	};
	
	// Animation settings
	anim = {
		// Button in the middle
		button: {
			anim_on:		true,	// (bool) Animation on
			travel_dis:		6,		// Travel distance (downwards)
			speed:			0.3		// Travel speed
		},
		
		// Buttons on the left side
		sidebar: {
			anim_on:		true,	// (bool) Animation on
			travel_dis: 	30,		// Travel distance (to the left)
			speed:			0.3		// Travel speed
		}
	};
	
	// Scrolling settings
	scrolling = {
		speed:		0.2,	// Scrollig speed
		disappear:	true	// (bool) Whether items should disappear when they go above menu start position or not
	};

#endregion

#region Menu array (user)

	menu = [
		["start",		new ScriptRunner(function startGame() { /* Do nothing */ }), 
		"resume",		new ScriptRunner(resumeGame)],
		
		["settings", [
			["audio", [
				["master",	new Slider([0, 1], 0.3,		"audio_master")],
				["sounds",	new Slider([0, 1], 1,		"audio_sounds")],
				["music",	new Slider([0, 1], 1,		"audio_music")]
			]],
		
			["graphics", [
				["lights",		new Shift(["Off", "Lights", "Lights & Shadows"], 2, "graphics_lights")],
				["blood",		new Toggle(true,	"graphics_blood")],
				["bullet_trail",new Toggle(true,	"graphics_bullet_trail")],
				["window_mode",	new Shift(["Windowed", "Fullscreen"], 1, "graphics_window_mode")],
				["vsync",		new Toggle(0,		"vsync")]
			]],
		
			["controls", new Controls(global.input_sys, "input_save.json")] // , ["right", "left", "jump"]
		]],
		
		["lots of stuff", [
			["thing 1", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 2", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 3", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 4", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 5", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 6", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 7", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 8", new ScriptRunner(function doNothing() { /* Do nothing */ })],
			["thing 9", new ScriptRunner(function doNothing() { /* Do nothing */ })]
		]],
		
		["credits",	new Credits(str_credits)],
		
		["quit",		new ScriptRunner(game_end),
		"title screen", new ScriptRunner(function gotoTitleScreen() {room = rTest})]
	];
	
	enum e_menu_presets {
		title_screen,
		pause_menu
	}

#endregion

#region Input setup (user)

	in_sys = new InputSystem({
		up:		["W",		vk_up,		gp_padu,	gp_axislu],		// Move up
		down:	["S",		vk_down,	gp_padd,	gp_axisld],		// Move down
		right:	["D",		vk_right,	gp_padr,	gp_axislr],		// Move right
		left:	["A",		vk_left,	gp_padl,	gp_axisll],		// Move left
		enter:	[vk_space,	vk_enter,	gp_a],						// Press button
		back:	["Q",		vk_escape,	gp_b]						// Previous page
	});

#endregion

#region Other stuff (system)

	#macro gui_w display_get_gui_width()
	#macro gui_h display_get_gui_height()
	
	#region Functions (system)
		
	function stringRemoveUderscore(str) {
		str = string_replace(str, "_", " ");
		str = string_replace(str, "-", " ");
		
		return str;
	}
	
	function col2(selected, c1, c2) {
		return selected ? {c1: c2, c2: c1} : {c1: c1, c2: c2};
	}
	
	#endregion
	
	#region Other vars (system)
	
	menu_enabled = true;
	menu_preset = 1;
	
	enum e_menu_element {
		name,
		val
	}
	
	// Animation
	enum e_anim_state {
		idle,
		increase,
		decrease,
		stop
	}
	
	enum e_anim_type {
		button,
		sidebar
	}
	
	sidebar_elements = ["Slider", "Toggle", "Shift", "Input"];
	
	page = menu;
	menu_option = 0;
	prev_pages = ds_stack_create();
	inputting = false;
	sn = undefined;
	menu_extension = undefined;
	anim_array = [];
	scrolling_y = undefined;
	scrolling_y_to = 0;
	
	#endregion

#endregion