/// @func menuSetPreset(preset)

/// @desc Switches menu preset

/// @param {real} preset    The preset to swich to, indexing starts from 0.

/// @return {undefined} N/A

function menuSetPreset(preset) {
    oMenu.menu_preset = preset + 1;
}