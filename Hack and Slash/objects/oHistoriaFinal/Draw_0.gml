var gui_w = display_get_gui_width()
var gui_h = display_get_gui_height()

var escala_x = 0.57
var escala_y = 0.34

var espacamento_x = 310
var espacamento_y = 370

var centro_x = gui_w / 2
var centro_y = gui_h / 2

// cima esquerda
draw_sprite_ext(
    parte5, 0,
    centro_x - espacamento_x,
    centro_y - espacamento_y / 2,
    escala_x, escala_y,
    0, c_white, alpha1
)

// cima direita
draw_sprite_ext(
    parte6, 0,
    centro_x + espacamento_x,
    centro_y - espacamento_y / 2,
    escala_x, escala_y,
    0, c_white, alpha2
)

// baixo esquerda
draw_sprite_ext(
    parte7, 0,
    centro_x - espacamento_x,
    centro_y + espacamento_y / 2,
    escala_x, escala_y,
    0, c_white, alpha3
)

// baixo direita
draw_sprite_ext(
    parte8, 0,
    centro_x + espacamento_x,
    centro_y + espacamento_y / 2,
    escala_x, escala_y,
    0, c_white, alpha4
)

// baixo direita
draw_sprite_ext(
    parte9, 0,
    centro_x,
    centro_y,
    escala_x, escala_y,
    0, c_white, alpha5
)