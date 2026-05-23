x += lengthdir_x(velocidade, direcao)
y += lengthdir_y(velocidade, direcao)
dist_perc += velocidade

if place_meeting(x, y, oParede) { instance_destroy(); exit }
if dist_perc >= dist_max        { instance_destroy(); exit }

if point_distance(x, y, oJogador.x, oJogador.y) < 16 {
    with (oJogador) {
        if !invulneravel {
            vida--
            invulneravel = true
            invul_timer  = 60
            var kb       = point_direction(other.x, other.y, x, y)
            knockback_x  = lengthdir_x(8, kb)
            knockback_y  = lengthdir_y(8, kb)
            dano_timer   = 20
            estado       = estados.Dano
        }
    }
    instance_destroy()
    exit
}