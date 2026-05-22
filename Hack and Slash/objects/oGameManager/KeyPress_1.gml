var key_esc = keyboard_check_pressed(vk_escape)
var key_r = keyboard_check_pressed(ord("R"))

if key_r {
	room_restart()
}

if key_esc {
	game_end()
}