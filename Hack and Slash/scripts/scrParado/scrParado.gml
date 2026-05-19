function scrParado()
{
    #region INPUTS
    var key_esquerda = keyboard_check(ord("A"))
    var key_direita = keyboard_check(ord("D"))
    var key_cima = keyboard_check(ord("W"));
    var key_baixo = keyboard_check(ord("S"))
    var key_ataque = keyboard_check_pressed(ord("J"))
	var key_dash =  keyboard_check_pressed(ord("K"))

	#endregion 

	#region DIREÇÃO
    var move_x = key_direita - key_esquerda
    var move_y = key_baixo - key_cima
	#endregion

	#region TROCA DE ESTADO
	
    // se começou a se mover, vai para o estado movimento
    if (move_x != 0 || move_y != 0) {
		
        estado = estados.Movimento
        
		exit
    }

    // ataque
    if (key_ataque) {
		
        estado = estados.Ataque1
		ataque_timer = ataque_time
		
		dir_x_ataque = dir_personagem

		exit
    }
	#endregion

    // não move nada enquanto parado
    velh = 0
    velv = 0
}