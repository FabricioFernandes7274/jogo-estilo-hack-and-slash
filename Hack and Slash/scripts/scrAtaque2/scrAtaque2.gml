function scrAtaque2()
{
    velh = 0
    velv = 0
	
	// COMBO CANCEL
    if keyboard_check_pressed(ord("K"))
    {
        ataque_executado = false
        proximo_combo = false
        is_ataque = false

        estado = estados.Dash

        dash_timer = 10
		dash_dir_x = dir_x_ataque

        exit
    }

    if !ataque_executado
    {
        ataque_executado = true
		acertou_inimigo = false

        var hit = instance_create_layer(
            x + 50 * dir_x_ataque,
            y,
            "Instances",
            oHitBox
        )

		hit.owner = id
    }

    if keyboard_check_pressed(ord("J") ) and acertou_inimigo
    {
        proximo_combo = true
    }

    ataque_timer--

    if ataque_timer <= 0
    {
        ataque_executado = false
        alvo = noone
		
        if proximo_combo
        {
            proximo_combo = false
            estado = estados.Ataque3
            ataque_timer = 20
        }
        else
        {
            estado = estados.Parado
        }
    }
}