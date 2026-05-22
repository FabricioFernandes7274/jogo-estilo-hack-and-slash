if instance_exists(oJogador)
{
    var player = instance_find(oJogador, 0)

    var hp = player.vida
    var max_hp = player.vida_max

    var bar_w = 200

    var hp_w = (hp / max_hp) * bar_w

    draw_text(20, 20, "HP: " + string(hp))

    // FUNDO
    draw_set_color(c_black)
    draw_rectangle(20, 50, 20 + bar_w, 70, true)

    // VIDA
    draw_set_color(c_red)
    draw_rectangle(20, 50, 20 + bar_w, 70, true)

    // BORDA
    draw_set_color(c_white)
    draw_rectangle(20, 50, 20 + hp_w, 70, false)
	

    draw_set_color(c_white)
}