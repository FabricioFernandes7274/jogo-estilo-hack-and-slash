#region VARIAVEIS DE MOVIMENTO

vel = 7
velv = 0
velh = 0
dir_x = 1
dir_y = 0
dir_personagem = 1

#endregion

#region VARIAVEIS DASH

dash_speed = 12
dash_time = 10 // duração do dash em frames
dash_timer = 0

is_dashing = false

dash_dir_x = 0
dash_dir_y = 0

#endregion

#region VARIAVEIS ATAQUE

ataque_speed = 12
ataque_time = 10 // duração do ataque
ataque_timer = 0

is_ataque = false

ataque_executado = false

dir_x_ataque = dir_x

alvo = noone
proximo_combo = false
acertou_inimigo = false

#endregion

#region VARIAVEIS DE DANO DO JOGADOR

dano_timer = 0

knockback_x = 0
knockback_y = 0

invulneravel = false
invul_timer = 0

#endregion

#region VARIAVEIS de ESTADO MORTO

morte_timer = 0

#endregion

#region VARIAVEIS DE STATUS

vida = 3
dano = 1
pontuacao = 0

enum Rank {
	noone,
	D,
	C,
	B,
	A,
	S,
	SS,
	SSS
}

style = Rank.noone

#endregion

#region ESCOLHA DE SPRITES

var personagens = [
	sprPlayer1,
	sprPlayer2,
	sprPlayer3,
	sprPlayer4
]

// sprite_index = personagens[global.personagem_escolhido]
sprite_index = sprPlayer1

#endregion

#region MAQUINA DE ESTADOS

enum estados {
	Parado,
	Movimento,
	Dash,
	Dano,
	Morto,
	Ataque1,
	Ataque2,
	Ataque3
}

estado = estados.Parado

#endregion

#region ESCALA DO PERSONAGEM

sprite_scale = 2
image_xscale = sprite_scale
image_yscale = sprite_scale

#endregion