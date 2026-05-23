function scrAtaque()
{	
	sprite_index = sprJogadorAtaque

	image_index += 0.35

	// limitar para os 4 primeiros frames
	if (image_index >= 4) {
	    image_index = 0;
	}
	
    // cria hitbox uma vez
    if !ataque_executado
    {
		audio_play_sound(ataqueJogador, 1, false)

        ataque_executado = true

        var atk_dist = 70

        var atk_x = x + lengthdir_x(atk_dist, dir_ataque)
        var atk_y = y + lengthdir_y(atk_dist, dir_ataque)

        var hit = instance_create_layer(
            atk_x,
            atk_y,
            "Instances",
            oHitBox
        )

        hit.owner = id
        hit.image_angle = dir_ataque
    }

    ataque_timer--

    if ataque_timer <= 0
    {
		is_ataque = false
        ataque_executado = false
        estado = estados.Parado
    }
}