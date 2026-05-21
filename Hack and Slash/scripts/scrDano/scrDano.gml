function scrDano()
{
    velh = knockback_x
    velv = knockback_y

    x += velh
    y += velv

    // diminui knockback aos poucos
    knockback_x *= 0.9
    knockback_y *= 0.9

    dano_timer--

    if dano_timer <= 0
    {
        velh = 0
        velv = 0

        estado = estados.Parado
    }
}