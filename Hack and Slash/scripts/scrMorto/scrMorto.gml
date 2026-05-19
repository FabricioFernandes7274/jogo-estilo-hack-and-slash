function scrMorto()
{
    velh = 0
    velv = 0

    is_ataque = false
    is_dashing = false

    morte_timer--

    if morte_timer <= 0
    {
        room_restart()
    }
}