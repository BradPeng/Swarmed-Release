function is_on_screen(){
    var _camera = view_camera[0];
    var _view_x = camera_get_view_x(_camera);
    var _view_y = camera_get_view_y(_camera);
    var _view_width = camera_get_view_width(_camera);
    var _view_height = camera_get_view_height(_camera);

    return !(x + sprite_width < _view_x or x - sprite_width > _view_x + _view_width or
             y + sprite_height < _view_y or y - sprite_height > _view_y + _view_height);
}