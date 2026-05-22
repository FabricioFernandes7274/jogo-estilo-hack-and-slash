var progresso = raio_atual / raio_max
var alpha     = 1 - progresso

draw_set_alpha(alpha)
draw_set_color(c_yellow)
draw_circle(x, y, raio_atual, false)
draw_set_color(c_orange)
draw_circle(x, y, raio_atual * 0.7, false)
draw_set_color(c_red)
draw_circle(x, y, raio_atual * 0.4, false)
draw_set_alpha(1)
draw_set_color(c_white)