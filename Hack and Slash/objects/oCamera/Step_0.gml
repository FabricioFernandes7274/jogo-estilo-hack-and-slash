// verifica se o alvo existe
// Se o objeto alvo não existir mais, para a execução do código (evita erro)
if not instance_exists(target_) exit

// lerp deixa o movimento suave
// Move o valor de x e y aos poucos em direção ao x do alvo (0.1 = suavidade)
x = lerp(x, target_.x, 0.1)
y = lerp(y, target_.y, 0.1)

// não deixa a camera ultrapassar o tamanho da room em x
var cam_x = clamp(
    x - width_/2,
    0,
    room_width - width_
)

// não deixa a camera ultrapassar o tamanho da room em y
var cam_y = clamp(
    y - height_/2,
    0,
    room_height - height_
)

// Aplica a posição da câmera,
// agora já limitada pelo clamp (bordas da room)
camera_set_view_pos(view_camera[0], cam_x, cam_y)