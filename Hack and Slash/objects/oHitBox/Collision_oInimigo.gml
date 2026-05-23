if other.dano_cooldown <= 0
{
	other.vida -= dano
    other.dano_cooldown = 20
	var kb_dir        = point_direction(x, y, other.x, other.y)
    other.knockback_x = lengthdir_x(7, kb_dir)
    other.knockback_y = lengthdir_y(7, kb_dir)
    other.dano_timer  = 22
    other.estado = estadosInimigo.Stagger
}

