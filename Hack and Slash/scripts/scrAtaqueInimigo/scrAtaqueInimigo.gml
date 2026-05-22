function scrAtaqueInimigo() {
    if !ataque_executado {
        ataque_executado = true
        var atk_dist = 70
        var atk_x    = x + lengthdir_x(atk_dist, dir_ataque)
        var atk_y    = y + lengthdir_y(atk_dist, dir_ataque)
        var hit      = instance_create_layer(atk_x, atk_y, "Instances", oHitBox)
        hit.owner       = id
        hit.image_angle = dir_ataque
    }
}