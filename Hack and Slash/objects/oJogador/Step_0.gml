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
	case estados.Ataque:
			scrAtaque()
			break
}