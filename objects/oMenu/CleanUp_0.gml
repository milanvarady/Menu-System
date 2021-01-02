/// @desc Delete things and save

saveToJson(global.settings, save_filename);

delete menu;
delete look;
delete audio;
delete in;
delete in_sys;
delete sidebar_elements;

ds_stack_destroy(prev_pages);