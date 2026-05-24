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
            move_colisao(dir_fuga, vel)
        }

        // Atira independente de estar recuando ou não
        if cd_tiro <= 0 && dist < dist_visao {
            cd_tiro   = cd_tiro_max
            atk_timer = 20
			audio_play_sound(flechaInimigo, 1, false)
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
            move_colisao(dir_fuga, vel)
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
	
		move_colisao(point_direction(0, 0, knockback_x, knockback_y), point_distance(0, 0, knockback_x, knockback_y))
		
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

function move_colisao(dir, spd)
{
    var nx = x + lengthdir_x(spd, dir)
    var ny = y + lengthdir_y(spd, dir)

    if (!place_meeting(nx, y, oParede)) {
        x = nx
    }

    if (!place_meeting(x, ny, oParede)) {
        y = ny
    }
}

if flash_dano > 0
{
    flash_dano--
    
    if flash_dano mod 2 == 0
    {
        image_alpha = 0.3
    }
    else
    {
        image_alpha = 1
    }
}
else
{
    image_alpha = 1
}