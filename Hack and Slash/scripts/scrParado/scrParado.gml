function scrParado()
{
    #region INPUTS
	
    var key_esquerda = keyboard_check(ord("A"))
    var key_direita  = keyboard_check(ord("D"))
    var key_cima     = keyboard_check(ord("W"))
    var key_baixo    = keyboard_check(ord("S"))

	#endregion 

	#region DIREÇÃO

    var move_x = key_direita - key_esquerda
    var move_y = key_baixo - key_cima

	#endregion

	#region ANIMAÇÃO

	if not is_ataque{
	    sprite_index = sprJogadorparado
	}
	#endregion

	#region TROCA DE ESTADO
	
    if (move_x != 0 || move_y != 0)
    {
        estado = estados.Movimento
        exit
    }
	
	#endregion

    velh = 0
    velv = 0
}