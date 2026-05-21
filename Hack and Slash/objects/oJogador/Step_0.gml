// ATAQUE
if mouse_check_button_pressed(mb_left)
and not is_ataque
and estado != estados.Dash
and estado != estados.Morto
{
    is_ataque = true

    ataque_timer = 15
    ataque_executado = false

    // salva direção do mouse
    dir_ataque = point_direction(x, y, mouse_x, mouse_y)
	
	// vira personagem
    if mouse_x > x
    {
        image_xscale = sprite_scale
    }
    else
    {
        image_xscale = -sprite_scale
    }
}

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
	default:
			estado = estados.Parado
			break
}

if is_ataque
{
    scrAtaque()
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