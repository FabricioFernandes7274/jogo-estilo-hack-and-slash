#region VARIAVEIS DE MOVIMENTO

vel = 8
velv = 0
velh = 0
dir_x = 1
dir_y = 0
dir_personagem = 1

#endregion

#region VARIAVEIS DASH

dash_speed = 14
dash_time = 12 
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
dir_ataque = 0

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
vida_max = 3
dano = 1

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
}

estado = estados.Parado

#endregion

#region ESCALA DO PERSONAGEM

sprite_scale = 2
image_xscale = sprite_scale
image_yscale = sprite_scale

#endregion

#region VARIAVEIS DE MANA E MAGIA

mana_max      = 100
mana          = 100
mana_regen    = 0.1
custo_bola    = 30
bola_cooldown = 0
bola_cd_max   = 45

#endregion