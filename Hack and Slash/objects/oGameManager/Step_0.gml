if (global.fases){
	if (instance_number(oInimigo) == 0 && instance_number(oArqueiro) == 0 && instance_number(oChefe) == 0 && !global.trocando_fase) {
		global.trocando_fase = true
		alarm[0] = room_speed * 1 // espera 1 segundo
	}
}

function proxima_fase() {
    global.fase_atual += 1
	if global.fase_atual == 4 {
		global.fases = false
		room_goto(rmHistoriaFinal)
		exit
	}
	else {
		global.trocando_fase = false
		room_goto(asset_get_index("rmFase0" + string(global.fase_atual)))
	}
}

function resetar_fases()
{
    global.fase_atual = 1
    global.max_fases = 3
    global.trocando_fase = false
    global.fases = true
}