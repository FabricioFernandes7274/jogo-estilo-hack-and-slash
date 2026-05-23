if instance_exists(oJogador)
{	
    var player = instance_find(oJogador, 0)

    var hp = player.vida
    var max_hp = player.vida_max

    var mana = player.mana
    var mana_max = player.mana_max

    var hud_x = 134
    var hud_y = 50
	
	// hp
    var hp_perc = hp / max_hp

    var hp_x = hud_x - 116
    var hp_y = hud_y - 20

    var hp_w = 245
    var hp_h = 22

    draw_set_color(c_black)

    draw_rectangle(
        hp_x,
        hp_y,
        hp_x + hp_w,
        hp_y + hp_h,
        false
    )

    draw_set_color(c_red)

    draw_rectangle(
        hp_x,
        hp_y,
        hp_x + (hp_w * hp_perc),
        hp_y + hp_h,
        false
    )

	// mana
    var mana_perc = mana / mana_max

    var mana_x = hp_x
    var mana_y = hp_y + 34

    var mana_w = 180
    var mana_h = 14

    draw_set_color(c_black)

    draw_rectangle(
        mana_x,
        mana_y,
        mana_x + mana_w,
        mana_y + mana_h,
        false
    )

    draw_set_color(c_blue)

    draw_rectangle(
        mana_x,
        mana_y,
        mana_x + (mana_w * mana_perc),
        mana_y + mana_h,
        false
    )

    // HUD por cima
    draw_sprite(HP, 0, hud_x, hud_y)

    // TEXTO
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)

    draw_set_color(c_white)

    draw_text(
        130,
        hp_y + 12,
        "HP: " + string(hp) + "/" + string(max_hp)
    )

    draw_text(
        mana_x + mana_w / 2,
        mana_y + 11,
        "Mana: " + string(floor(mana)) + "/" + string(mana_max)
    )
	
	var qtd_inimigos = instance_number(oInimigo)
	var qtd_arqueiros = instance_number(oArqueiro)
	var qtd_chefes = instance_number(oChefe)
	
	draw_text(
    55,
    mana_y * 2 - 10,
    "Inimgos: " + string(qtd_inimigos + qtd_arqueiros + qtd_chefes)
)
}