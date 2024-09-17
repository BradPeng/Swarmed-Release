/// @description Insert description here
surf_mini_map_bg = -1;
surf_mini_map_entities = -1;
h = room_height / 16;

w = room_width / 16;

x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - h;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - w;

refresh_map_bg();
