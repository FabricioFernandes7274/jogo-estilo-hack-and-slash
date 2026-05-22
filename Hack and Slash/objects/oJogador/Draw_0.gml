draw_self()
var bx = 20
var by = 50
var bw = 150
var bh = 14

draw_set_color(c_navy)
draw_rectangle(bx, by, bx + bw, by + bh, false)

draw_set_color(c_blue)
draw_rectangle(bx, by, bx + (bw * (mana / mana_max)), by + bh, false)

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_text(bx, by - 16, "Mana: " + string(floor(mana)) + "/" + string(mana_max))