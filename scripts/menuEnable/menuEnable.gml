/// @func menuEnable(enable)

/// @desc This function enables/disables menu

/// @param {bool} enable    Whether to enable or disable the menu

/// @returns {undefined} N/A

function menuEnable(enable) {
    if (enable) {
        // Enable
        oMenu.menu_enabled = true;
    } else {
        // Disable
        with (oMenu) {
            saveMenu();
            menu_enabled = false;
        }
    }
}