function scrDash()
{
	is_dashing = true
	
	// calcula para onde o personagem vai se mover no dash
	var nx = x + dash_dir_x * dash_speed
	var ny = y + dash_dir_y * dash_speed
	
	// colisão X
    if (!place_meeting(nx, y, oParede)) x = nx;
    else dash_dir_x = 0;
	
	// colisão Y
    if (!place_meeting(x, ny, oParede))  y = ny;
    else dash_dir_y = 0;

    dash_timer--;
	
	// quando o dash acaba volta por estado parado
    if dash_timer <= 0 {
        estado = estados.Parado
		is_dashing = false
    }
}