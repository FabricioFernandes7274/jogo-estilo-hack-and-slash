if dano_cooldown > 0
{
    dano_cooldown--
}

if vida <= 0 {
    estado =estadosInimigo.Morto
}
var px   = oJogador.x
var py   = oJogador.y
var dist = point_distance(x, y, px, py)
var ve   = !collision_line(x, y, px, py, oParede, false, true)
           && dist < dist_visao

if ve {
    last_seen_x   = px
    last_seen_y   = py
    has_last_seen = true
}

switch estado {

    case estadosInimigo.Patrol:
        var wp = waypoints[wp_index]
        var wd = point_distance(x, y, wp[0], wp[1])
        if wd > 4 {
            x += ((wp[0] - x) / wd) * (vel * 0.6)
            y += ((wp[1] - y) / wd) * (vel * 0.6)
        } else {
            wp_index = (wp_index + 1) mod array_length(waypoints)
        }
        if ve estado = estadosInimigo.Chase
    break

case estadosInimigo.Chase:
    var tx = 0
    var ty = 0
    if ve {
        tx = px
        ty = py
    } else {
        tx = last_seen_x
        ty = last_seen_y
    }
    
    var ddir = point_direction(x, y, tx, ty)
    x += lengthdir_x(vel, ddir)
    y += lengthdir_y(vel, ddir)

    if dist < dist_ataque {
        estado = estadosInimigo.Combat
    }
    if !ve {
        if !has_last_seen {
            estado = estadosInimigo.Patrol
        } else if point_distance(x, y, last_seen_x, last_seen_y) < 16 {
            has_last_seen = false
            estado = estadosInimigo.Patrol
        }
    }
break

    case estadosInimigo.Combat:
        atk_cooldown--
        dir_ataque = point_direction(x, y, px, py)

        var desired = dist_ataque * 0.8
        if dist > desired + 8 {
            x += lengthdir_x(vel, dir_ataque)
            y += lengthdir_y(vel, dir_ataque)
        } else if dist < desired - 8 {
            x -= lengthdir_x(vel * 0.5, dir_ataque)
            y -= lengthdir_y(vel * 0.5, dir_ataque)
        } else {
            x += lengthdir_x(vel * 0.6, dir_ataque + 90)
            y += lengthdir_y(vel * 0.6, dir_ataque + 90)
        }

        if atk_cooldown <= 0 && dist < dist_ataque {
            atk_cooldown     = atk_rate
            ataque_executado = false
            scrAtaqueInimigo()
        }

        if dist > dist_fuga estado = estadosInimigo.Chase
    break

    case estadosInimigo.Stagger:
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
            estado = estadosInimigo.Combat
        }
    break

    case estadosInimigo.Morto:
        instance_destroy()
    break
}