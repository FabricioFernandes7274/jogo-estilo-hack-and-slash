if estado == estados.Morto {
	exit
}

if not invulneravel and estado != estados.Dash
{
    vida -= 1
	
	if vida <= 0 {
	    estado = estados.Morto
	    morte_timer = 20
	} else {

    invulneravel = true
    invul_timer = 30

    dano_timer = 15

    knockback_x = sign(x - other.x) * 6
    knockback_y = sign(y - other.y) * 6

    estado = estados.Dano
	}
}