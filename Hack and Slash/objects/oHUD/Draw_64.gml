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
	
	var bx = 20
	var by = 100
	var bw = 150
	var bh = 14
	
	var mana = player.mana
	var mana_max = player.mana_max

	draw_set_color(c_navy)
	draw_rectangle(bx, by, bx + bw, by + bh, false)

	draw_set_color(c_blue)
	draw_rectangle(bx, by, bx + (bw * (mana / mana_max)), by + bh, false)

	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_text(bx, by - 16, "Mana: " + string(floor(mana)) + "/" + string(mana_max))
}