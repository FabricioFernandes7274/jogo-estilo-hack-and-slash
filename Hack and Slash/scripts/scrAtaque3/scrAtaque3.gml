function scrAtaque3()
{
    velh = 0
    velv = 0

    if !ataque_executado
    {
        ataque_executado = true

        var hit = instance_create_layer(
            x + 50 * dir_x_ataque,
            y,
            "Instances",
            oHitBox
        )

		hit.owner = id
    }

    ataque_timer--
    if ataque_timer <= 0
    {
        ataque_executado = false
        alvo = noone
         estado = estados.Parado
    }
}