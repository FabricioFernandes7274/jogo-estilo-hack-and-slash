if explodiu exit

x += lengthdir_x(velocidade, direcao)
y += lengthdir_y(velocidade, direcao)
dist_perc += velocidade

if place_meeting(x, y, oParede)  { scrExplosao(); exit }
if dist_perc >= dist_max         { scrExplosao(); exit }
if point_distance(x, y, alvo_x, alvo_y) < velocidade { scrExplosao(); exit }

with (oInimigo) {
    if point_distance(x, y, other.x, other.y) < 32 {
		flash_dano = 25
        with (other) { scrExplosao(); }
        exit
    }
}
with (oChefe) {
    if point_distance(x, y, other.x, other.y) < 32 {
		flash_dano = 25
        with (other) { scrExplosao(); }
        exit
    }
}
with (oArqueiro) {
    if point_distance(x, y, other.x, other.y) < 32 {
		flash_dano = 25
        with (other) { scrExplosao(); }
        exit
    }
}