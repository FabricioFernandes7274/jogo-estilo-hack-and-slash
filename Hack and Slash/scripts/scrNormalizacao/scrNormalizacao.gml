function scrNormalizacao(_x, _y) {
	var len = point_distance(0, 0, _x, _y)

    if (len == 0) return [0, 0]

    return [_x / len, _y / len]
}