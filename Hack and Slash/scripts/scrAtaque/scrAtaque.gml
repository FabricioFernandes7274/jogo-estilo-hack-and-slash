function scrAtaque()
{
    velh = 0;
    velv = 0;

    ataque_timer--;

    if (ataque_timer <= 0)
    {
        estado = estados.Parado;
    }
}