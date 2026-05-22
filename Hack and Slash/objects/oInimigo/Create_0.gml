enum estadosInimigo {
    Patrol, Chase, Combat, Stagger, Morto
}
vel = 3

vida = 10
dano_cooldown = 0

estado        = estadosInimigo.Patrol

dist_visao    = 220
dist_ataque   = 65
dist_fuga     = 290

atk_cooldown     = 0
atk_rate         = 70
ataque_executado = false
dir_ataque       = 0

dano_timer    = 22
knockback_x   = 0
knockback_y   = 0
velh          = 0
velv          = 0

waypoints     = [[100,200],[400,200],[400,400],[100,400]]
wp_index      = 0

last_seen_x   = 0
last_seen_y   = 0
has_last_seen = false