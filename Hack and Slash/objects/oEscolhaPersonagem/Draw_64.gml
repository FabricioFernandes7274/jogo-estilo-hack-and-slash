var gui_w = display_get_gui_width()
var gui_h = display_get_gui_height()

var escala_x = 1.03
var escala_y = 1.10

var centro_x = gui_w / 2
var centro_y = gui_h / 2

draw_sprite_ext(
    Selecao, index,
    centro_x,
    centro_y,
    escala_x, escala_y,
    0, c_white, 1
)