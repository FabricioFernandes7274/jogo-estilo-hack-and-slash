function scrMovimento()
{
    #region INPUTS
    var key_esquerda = keyboard_check(ord("A"))
    var key_direita = keyboard_check(ord("D"))
    var key_cima = keyboard_check(ord("W"))
    var key_baixo = keyboard_check(ord("S"))
    var key_ataque = keyboard_check(ord("J"))
	var key_dash =  keyboard_check_pressed(ord("K"))
    #endregion

    #region DIRECAO
    var move_x = key_direita - key_esquerda
    var move_y = key_baixo - key_cima
	
	if move_x != 0 {
	    dir_personagem = sign(move_x)
	}
    #endregion

    #region NORMALIZACAO
	var dir = scrNormalizacao(move_x, move_y)

    move_x = dir[0]
    move_y = dir[1]

    #endregion

    #region VELOCIDADE
    velh = vel * move_x
    velv = vel * move_y
    #endregion

    #region COLISAO PAREDE
    if place_meeting(x + velh, y, oParede) velh = 0
    if place_meeting(x, y + velv, oParede) velv = 0
    #endregion

    #region MOVIMENTO
    x += velh
    y += velv
    #endregion

	#region VIRAR SPRITE

	if move_x > 0 {
	    image_xscale = sprite_scale
	}

	if move_x < 0 {
	    image_xscale = -sprite_scale
	}

	#endregion

    #region TRANSIÇÕES

	if estado == estados.Movimento {
		if move_x == 0 && move_y == 0 {
			     estado = estados.Parado
		}
	}

    // ataque
    if key_ataque {
        estado = estados.Ataque1
		ataque_timer = ataque_time
		
		if move_x != 0 { 
			dir_x_ataque = sign(move_x)
		}
    }

    // dash
    if key_dash {
        estado = estados.Dash
        dash_timer = dash_time
		
		var dir = scrNormalizacao(move_x, move_y)
		
		dash_dir_x = dir[0]
		dash_dir_y = dir[1]
    }

    #endregion
}