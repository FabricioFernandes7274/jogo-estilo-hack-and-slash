var key_cima = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
var key_baixo = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)
var key_enter = keyboard_check_pressed(vk_enter)

if key_cima {
	index--
	if index < 0 {
		index = total - 1
	}
}

if key_baixo {
	index++
	if index > total - 1 {
		index = 0
	}
}

// confirmar personagem
if key_enter {
	if index == 0 {
		room_goto(rmHistoriaIcinicio)
	}
}