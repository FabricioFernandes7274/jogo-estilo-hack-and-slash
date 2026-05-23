enum estadosArqueiro {
    Idle, Recuar, Atirar, Stagger, Morto
}

estado        = estadosArqueiro.Idle
vida            = 4
vel           = 2.5
dist_visao    = 350
dist_ideal    = 250  // distância que ele quer manter
dist_fuga     = 80   // se jogador chegar mais perto que isso, recua urgente

cd_tiro       = 0
cd_tiro_max   = 90
atk_timer     = 0
dir_ataque    = 0

dano_cooldown = 0
dano_timer    = 0
knockback_x   = 0
knockback_y   = 0
velh          = 0
velv          = 0