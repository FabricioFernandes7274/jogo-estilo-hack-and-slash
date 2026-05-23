function scrExplosao() {
    if explodiu exit
    explodiu = true

    instance_create_layer(x, y, "Instances", oExplosao)

    var exp_x    = x
    var exp_y    = y
    var exp_raio = raio_exp
    var exp_dano = dano_exp

    with (oInimigo) {
        if point_distance(x, y, exp_x, exp_y) <= exp_raio {
            var kb_dir  = point_direction(exp_x, exp_y, x, y)
            knockback_x = lengthdir_x(9, kb_dir)
            knockback_y = lengthdir_y(9, kb_dir)
            dano_timer  = 22
            vida       -= exp_dano
            if vida <= 0 { estado = estadosInimigo.Morto }
            else          { estado = estadosInimigo.Stagger }
        }
    }

    with (oArqueiro) {
        if point_distance(x, y, exp_x, exp_y) <= exp_raio {
            var kb_dir  = point_direction(exp_x, exp_y, x, y)
            knockback_x = lengthdir_x(9, kb_dir)
            knockback_y = lengthdir_y(9, kb_dir)
            dano_timer  = 22
            vida       -= exp_dano
            if vida <= 0 { estado = estadosArqueiro.Morto }
            else          { estado = estadosArqueiro.Stagger }
        }
    }

    with (oChefe) {
        if point_distance(x, y, exp_x, exp_y) <= exp_raio {
            var kb_dir  = point_direction(exp_x, exp_y, x, y)
            knockback_x = lengthdir_x(9, kb_dir)
            knockback_y = lengthdir_y(9, kb_dir)
            dano_timer  = 22
            hp         -= exp_dano
            if hp <= 0 { estado = estadosChefao.Morto }
            else        { estado = estadosChefao.Stagger }
        }
    }

    instance_destroy()
}