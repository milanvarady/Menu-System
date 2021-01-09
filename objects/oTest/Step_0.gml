// Change settings
var col = c_white;

switch global.settings.player_col {
	case 0: col = c_red; break;
	case 1: col = c_green; break;
	case 2: col = c_blue; break;
}

image_blend = col;

image_xscale = global.settings.player_size;
image_yscale = image_xscale;

var in = global.input_sys.check();

var hsp = in.right.down - in.left.down;
var vsp = in.down.down - in.up.down;
var spd = global.settings.player_speed;

x += hsp * spd;
y += vsp * spd;