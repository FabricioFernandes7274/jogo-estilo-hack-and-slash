if dano_cooldown > 0 dano_cooldown--
if telegraf_timer > 0 telegraf_timer--

if hp <= hp_max / 2 && !transitou {
    transitou  = true
    fase       = 2
    vel        = 5
    cd_melee   = 0
    cd_cone    = 0
    cd_rajada  = 0
    cd_circulo = 0
    cd_laser   = 0
}

if hp <= 0 estado = estadosChefao.Morto

cd_melee--
cd_cone--
cd_rajada--
cd_circulo--
cd_laser--

var px   = oJogador.x
var py   = oJogador.y
var dist = point_distance(x, y, px, py)
dir_ataque = point_direction(x, y, px, py)

switch estado {

    case estadosChefao.Idle:
        if instance_exists(oJogador) && dist < dist_visao {
            estado = estadosChefao.Chase
        }
    break

    case estadosChefao.Chase:
        x += lengthdir_x(vel, dir_ataque)
        y += lengthdir_y(vel, dir_ataque)

        if dist < dist_melee {
            if cd_cone <= 0 {
                telegraf_timer   = 40
                telegraf_tipo    = "AOE"
                atk_timer        = 40
                ataque_executado = false
                cd_cone          = (fase == 1) ? 240 : 150
                estado           = estadosChefao.ConeAOE
            } else if cd_melee <= 0 {
                telegraf_timer   = 20
                telegraf_tipo    = "MELEE"
                atk_timer        = 20
                ataque_executado = false
                cd_melee         = (fase == 1) ? 80 : 45
                estado           = estadosChefao.Melee
            }
        } else {
            if cd_laser <= 0 {
                telegraf_timer = 50
                telegraf_tipo  = "LASER"
                laser_timer    = laser_dur
                laser_ativo    = false
                cd_laser       = laser_cd_tot
                estado         = estadosChefao.Laser
            } else if cd_circulo <= 0 {
                telegraf_timer   = 25
                telegraf_tipo    = "CIRCULO"
                atk_timer        = 10
                ataque_executado = false
                cd_circulo       = (fase == 1) ? 360 : 220
                estado           = estadosChefao.Circulo
            } else if cd_rajada <= 0 {
                telegraf_timer   = 25
                telegraf_tipo    = "RAJADA"
                atk_timer        = 15
                ataque_executado = false
                cd_rajada        = (fase == 1) ? 180 : 100
                estado           = estadosChefao.Rajada
            }
        }
    break

    case estadosChefao.Melee:
        atk_timer--
        if !ataque_executado && atk_timer <= 10 {
            ataque_executado = true
            var hit = instance_create_layer(
                x + lengthdir_x(50, dir_ataque),
                y + lengthdir_y(50, dir_ataque),
                "Instances", oHitBox
            )
            hit.owner       = id
            hit.image_angle = dir_ataque
        }
        if atk_timer <= 0 estado = estadosChefao.Chase
    break

    case estadosChefao.ConeAOE:
        atk_timer--
        if !ataque_executado && atk_timer <= 20 {
            ataque_executado = true
            var ang_diff = abs(angle_difference(dir_ataque,
                           point_direction(x, y, px, py)))
            if ang_diff <= 30 && dist < 90 {
                with (oJogador) {
                    if !invulneravel {
                        vida--
                        invulneravel = true
                        invul_timer  = 60
                        var kb       = point_direction(other.x, other.y, x, y)
                        knockback_x  = lengthdir_x(10, kb)
                        knockback_y  = lengthdir_y(10, kb)
                        dano_timer   = 20
                        estado       = estados.Dano
                    }
                }
            }
        }
        if atk_timer <= 0 {
            ataque_executado = false
            estado = estadosChefao.Chase
        }
    break

    case estadosChefao.Rajada:
        atk_timer--
        if !ataque_executado && atk_timer <= 5 {
            ataque_executado = true
            var i = 0
            repeat(3) {
                var ang = dir_ataque + (i - 1) * 20
                var p   = instance_create_layer(x, y, "Instances", oProjBoss)
                p.direcao = ang
                i++
            }
        }
        if atk_timer <= 0 {
            ataque_executado = false
            estado = estadosChefao.Chase
        }
    break

    case estadosChefao.Circulo:
        atk_timer--
        if !ataque_executado && atk_timer <= 5 {
            ataque_executado = true
            var i = 0
            repeat(8) {
                var ang = i * 45
                var p   = instance_create_layer(x, y, "Instances", oProjBoss)
                p.direcao = ang
                i++
            }
            if fase == 2 {
                i = 0
                repeat(8) {
                    var ang = i * 45 + 22.5
                    var p   = instance_create_layer(x, y, "Instances", oProjBoss)
                    p.direcao = ang
                    i++
                }
            }
        }
        if atk_timer <= 0 {
            ataque_executado = false
            estado = estadosChefao.Chase
        }
    break

   case estadosChefao.Laser:
    // Fase 1: charge — trava direção e fica parado
    if !laser_ativo && laser_charge_timer < laser_charge_dur {
        if laser_charge_timer == 0 {
            laser_dir = dir_ataque  // trava a direção aqui
        }
        laser_charge_timer++
    }

    // Fase 2: dispara o laser após o charge
    if laser_charge_timer >= laser_charge_dur {
        if !laser_ativo {
            laser_ativo = true
        }
        laser_timer--

        var ang_diff = abs(angle_difference(laser_dir,
                       point_direction(x, y, px, py)))
        if ang_diff < 6 && dist < 400 {
            with (oJogador) {
                if !invulneravel {
                    vida--
                    invulneravel = true
                    invul_timer  = 40
                    estado       = estados.Dano
                    dano_timer   = 15
                }
            }
        }

        if laser_timer <= 0 {
            laser_ativo        = false
            laser_charge_timer = 0
            estado             = estadosChefao.Chase
        }
    }
break

    case estadosChefao.Stagger:
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
            estado = estadosChefao.Chase
        }
    break

    case estadosChefao.Morto:
        instance_destroy()
    break
}