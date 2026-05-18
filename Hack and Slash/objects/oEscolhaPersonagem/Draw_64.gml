// fundo
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(fntEscolhaPersonagem)

// título
draw_text(room_width/2, 100, "Escolha seu personagem")

// espaçamento entre os personagens
var espacamento = 150

// centraliza o grupo inteiro
var inicio_x = room_width/2 - (total * espacamento) / 2 + espacamento / 2

draw_set_font(fntMainMenu)
for (var i = 0; i < total; i++)
{
	if index == i {
		draw_set_color(c_yellow)
	} else {
		draw_set_color(c_white)
	}
	
    draw_sprite(
        personagens[i],
        0,
        inicio_x + i * espacamento,
        room_height / 2
    )
	
		// texto abaixo do personagem
	var nome = personagem_nome[i];

	draw_text(inicio_x + i * espacamento, room_height / 2 + 50, nome)
}

draw_set_font(fntEscolhaPersonagem)

// reset cor
draw_set_color(c_white)

// ajuda
draw_text(
    room_width/2,
    room_height - 100,
    "<  > para trocar"
)

// reseta a font questão de boa prática
draw_set_font(-1)