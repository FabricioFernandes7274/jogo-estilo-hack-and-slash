if other.dano_cooldown <= 0 {
    var kb_dir          = point_direction(x, y, other.x, other.y)
    other.knockback_x   = lengthdir_x(7, kb_dir)
    other.knockback_y   = lengthdir_y(7, kb_dir)
    other.dano_timer    = 18
    other.hp           -= dano
    other.dano_cooldown = 20
	other.flash_dano = 25
    if other.hp <= 0 {
        other.estado = estadosChefao.Morto
    } else {
        other.estado = estadosChefao.Stagger
    }
}