// This function is used by the menu system, you don't have to worry about it!

// Finds struct in a menu array

function findStruct(arr) {
	var strc
	
	try {
		strc = arr[e_menu_element.val];
		if (!is_struct(strc)) strc = undefined;
	} catch(e) {
		strc = undefined;
	}
	
	return strc;
}