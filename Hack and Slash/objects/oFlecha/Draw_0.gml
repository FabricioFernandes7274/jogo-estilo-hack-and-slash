draw_set_color(c_white)
var tx = x + lengthdir_x(16, direcao)
var ty = y + lengthdir_y(16, direcao)
var bx = x - lengthdir_x(8, direcao)
var by = y - lengthdir_y(8, direcao)
// cabo
draw_line_width(bx, by, tx, ty, 3)
// ponta
draw_set_color(c_silver)
draw_triangle(
    tx, ty,
    tx + lengthdir_x(8, direcao + 140),
    ty + lengthdir_y(8, direcao + 140),
    tx + lengthdir_x(8, direcao - 140),
    ty + lengthdir_y(8, direcao - 140),
    false
)
draw_set_color(c_white)