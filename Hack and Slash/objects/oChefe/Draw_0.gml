draw_self()

// Barra de HP
var bw = 60
var bh = 8
var bx = x - bw / 2
var by = y - 50
draw_set_color(c_red)
draw_rectangle(bx, by, bx + bw, by + bh, false)
draw_set_color(c_lime)
draw_rectangle(bx, by, bx + (bw * (hp / hp_max)), by + bh, false)

// Laser
if !laser_ativo && laser_charge_timer > 0 {
    var progresso = laser_charge_timer / laser_charge_dur
    var lx2 = x + lengthdir_x(400, laser_dir)
    var ly2 = y + lengthdir_y(400, laser_dir)
    draw_set_alpha(progresso * 0.6)
    draw_set_color(c_yellow)
    draw_line_width(x, y, lx2, ly2, 2 + (progresso * 6))
    draw_set_alpha(1)
    draw_set_color(c_white)
}

// Laser ativo
if laser_ativo {
    var lx2 = x + lengthdir_x(400, laser_dir)
    var ly2 = y + lengthdir_y(400, laser_dir)
    draw_set_color(c_yellow)
    draw_line_width(x, y, lx2, ly2, 4)
    draw_set_color(c_white)
    draw_line_width(x, y, lx2, ly2, 2)
    draw_set_color(c_white)
}

// Telegraf
if telegraf_timer > 0 {
    var pisca = (telegraf_timer mod 6) < 3
    if pisca {
        if telegraf_tipo == "LASER"   draw_set_color(c_yellow)
        if telegraf_tipo == "AOE"     draw_set_color(c_orange)
        if telegraf_tipo == "RAJADA"  draw_set_color(c_red)
        if telegraf_tipo == "CIRCULO" draw_set_color(c_fuchsia)
        if telegraf_tipo == "MELEE"   draw_set_color(c_white)
        draw_circle(x, y, 28 + (telegraf_timer mod 8), true)
        draw_set_color(c_white)
        draw_set_halign(fa_center)
        draw_set_valign(fa_bottom)
        draw_text(x, y - 55, telegraf_tipo)
        draw_set_valign(fa_top)
    }

    if telegraf_tipo == "LASER" {
        var lx2 = x + lengthdir_x(400, dir_ataque)
        var ly2 = y + lengthdir_y(400, dir_ataque)
        draw_set_color(c_yellow)
        draw_set_alpha(0.3)
        draw_line_width(x, y, lx2, ly2, 6)
        draw_set_alpha(1)
        draw_set_color(c_white)
    }
    if telegraf_tipo == "AOE" {
        draw_set_color(c_orange)
        draw_set_alpha(0.25)
        var i = -30
        repeat(7) {
            var cx  = x + lengthdir_x(90, dir_ataque + i)
            var cy  = y + lengthdir_y(90, dir_ataque + i)
            var cx2 = x + lengthdir_x(90, dir_ataque + i + 10)
            var cy2 = y + lengthdir_y(90, dir_ataque + i + 10)
            draw_triangle(x, y, cx, cy, cx2, cy2, false)
            i += 10
        }
        draw_set_alpha(1)
        draw_set_color(c_white)
    }
    if telegraf_tipo == "CIRCULO" {
        draw_set_color(c_fuchsia)
        draw_set_alpha(0.2)
        draw_circle(x, y, 120, true)
        draw_set_alpha(1)
        draw_set_color(c_white)
    }
}