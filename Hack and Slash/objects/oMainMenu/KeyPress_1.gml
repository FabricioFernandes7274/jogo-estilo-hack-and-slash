var key_cima = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
var key_baixo = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)
var key_enter = keyboard_check_pressed(vk_enter)

if key_cima {
	index--
	if index < 0 {
		index = op_max - 1
	}
}

if key_baixo {
	index++
	if index > op_max - 1 {
		index = 0
	}
}

if key_enter {
	if index == 0 {
		room_goto(rmEscolhaPersonagem)
	}

	if index == 2 {
		game_end()
	}
}