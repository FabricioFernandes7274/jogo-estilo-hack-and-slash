function scrExplosao() {
    if explodiu exit
    explodiu = true

    // Cria efeito visual de explosão
    instance_create_layer(x, y, "Instances", oExplosao)

    // Dano em área — acerta todos os inimigos no raio
    with (oInimigo) {
        if point_distance(x, y, other.x, other.y) <= other.raio_exp {
            var kb_dir        = point_direction(other.x, other.y, x, y)
            knockback_x       = lengthdir_x(9, kb_dir)
            knockback_y       = lengthdir_y(9, kb_dir)
            dano_timer        = 22
            vida              -= other.dano_exp
            if vida <= 0 {
                estado = estadosInimigo.Morto
            } else {
                estado = estadosInimigo.Stagger
            }
        }
    }

    instance_destroy()
}