enum estadosChefao {
    Idle, Chase, Melee, ConeAOE, Rajada, Circulo, Laser, Stagger, Morto
}

estado     = estadosChefao.Idle
fase       = 1
hp         = 20
hp_max     = 60
vel        = 3.5

dist_visao   = 350
dist_melee   = 60
dist_fuga    = 400

cd_melee     = 0
cd_cone      = 0
cd_rajada    = 0
cd_circulo   = 0
cd_laser     = 0

atk_timer        = 0
ataque_executado = false
dir_ataque       = 0

dano_timer    = 0
knockback_x   = 0
knockback_y   = 0
velh          = 0
velv          = 0
dano_cooldown = 0

laser_ativo  = false
laser_timer  = 0
laser_dur    = 120
laser_cd_tot = 300
laser_dir    = 0
laser_charge_timer = 0
laser_charge_dur   = 90  

transitou    = false

telegraf_timer = 0
telegraf_tipo  = ""

flash_dano = 0