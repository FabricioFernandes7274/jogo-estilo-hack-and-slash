switch (estado) {
	case estados.Parado:
			scrParado()
			break
	case estados.Movimento:
			scrMovimento()
			break
	case estados.Dash:
			scrDash()
			break
	case estados.Dano:
			scrDano()
			break
	case estados.Morto:
			scrMorto()
			break
	case estados.Ataque1:
			scrAtaque1()
			break
	case estados.Ataque2:
			scrAtaque2()
			break
	case estados.Ataque3:
			scrAtaque3()
			break
	default:
			estado = estados.Parado
			break
}

if invulneravel
{
    invul_timer--

    if invul_timer <= 0
    {
        invulneravel = false
    }
}

if invulneravel
{
    image_alpha = 0.5
}
else
{
    image_alpha = 1
}