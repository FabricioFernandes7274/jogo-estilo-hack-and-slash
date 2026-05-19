function scrAtaque1()
{
	
	is_ataque = true
	
    velh = 0
    velv = 0
	
	// COMBO CANCEL
    if  keyboard_check_pressed(ord("K"))
    {
        ataque_executado = false
        proximo_combo = false
        is_ataque = false

        estado = estados.Dash

        dash_timer = 10
		dash_dir_x = dir_x_ataque

        exit
    }
	
	 // cria hitbox só uma vez
    if !ataque_executado {
		acertou_inimigo = false
        ataque_executado = true

        var atk_dist = 40

        var atk_x = x + dir_x_ataque * atk_dist
        var atk_y = y

        var hit = instance_create_layer(
            atk_x,
            atk_y,
            "Instances",
            oHitBox
			)
		
		hit.owner = id
	}
	
	 // continuar combo
    if keyboard_check_pressed(ord("J")) and acertou_inimigo
    {
        proximo_combo = true
    }
		
    ataque_timer--;
    if (ataque_timer <= 0) {
		ataque_executado = false
		
		if proximo_combo
        {
            proximo_combo = false
            estado = estados.Ataque2
            ataque_timer = 20
        } else {
			is_ataque = false
	        estado = estados.Parado
		}	
    }
}