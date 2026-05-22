if explodiu exit

x += lengthdir_x(velocidade, direcao)
y += lengthdir_y(velocidade, direcao)
dist_perc += velocidade

// Explode ao bater em parede
if place_meeting(x, y, oParede) {
    scrExplosao()
    exit
}

// Explode ao chegar no alvo (posição do mouse no momento do lançamento)
if point_distance(x, y, alvo_x, alvo_y) < velocidade {
    scrExplosao()
    exit
}

// Explode se passou da distância máxima
if dist_perc >= dist_max {
    scrExplosao()
    exit
}