var gui_w = display_get_gui_width()
var gui_h = display_get_gui_height()

var escala_x = 0.57
var escala_y = 0.50

var centro_x = gui_w / 2
var centro_y = gui_h / 2

draw_sprite_ext(
    Tela_inicial, index,
    centro_x,
    centro_y,
    escala_x, escala_y,
    0, c_white, 1
)