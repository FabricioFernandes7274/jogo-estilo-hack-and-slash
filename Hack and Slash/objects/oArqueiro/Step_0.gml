if dano_cooldown > 0 dano_cooldown--
if vida <= 0 estado = estadosArqueiro.Morto

cd_tiro--

var px   = oJogador.x
var py   = oJogador.y
var dist = point_distance(x, y, px, py)
dir_ataque = point_direction(x, y, px, py)

switch estado {

    case estadosArqueiro.Idle:
        if dist < dist_visao estado = estadosArqueiro.Recuar
    break

    case estadosArqueiro.Recuar:
        // Sempre recua se jogador estiver perto demais
        if dist < dist_ideal {
            var dir_fuga = point_direction(px, py, x, y)
            x += lengthdir_x(vel, dir_fuga)
            y += lengthdir_y(vel, dir_fuga)
        }

        // Atira independente de estar recuando ou não
        if cd_tiro <= 0 && dist < dist_visao {
            cd_tiro   = cd_tiro_max
            atk_timer = 20
            estado    = estadosArqueiro.Atirar
        }

        // Perde o jogador de vista
        if dist > dist_visao estado = estadosArqueiro.Idle
    break

    case estadosArqueiro.Atirar:
        atk_timer--

        // Continua recuando enquanto prepara o tiro
        if dist < dist_ideal {
            var dir_fuga = point_direction(px, py, x, y)
            x += lengthdir_x(vel, dir_fuga)
            y += lengthdir_y(vel, dir_fuga)
        }

        // Dispara na metade do timer
        if atk_timer == 10 {
            var f       = instance_create_layer(x, y, "Instances", oFlecha)
            f.direcao   = dir_ataque
            f.image_angle = dir_ataque
        }

        if atk_timer <= 0 estado = estadosArqueiro.Recuar
    break

    case estadosArqueiro.Stagger:
        velh = knockback_x
        velv = knockback_y
        x += velh
        y += velv
        knockback_x *= 0.9
        knockback_y *= 0.9
        dano_timer--
        if dano_timer <= 0 {
            velh   = 0
            velv   = 0
            estado = estadosArqueiro.Recuar
        }
    break

    case estadosArqueiro.Morto:
        instance_destroy()
    break
}