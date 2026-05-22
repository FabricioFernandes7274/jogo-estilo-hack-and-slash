tempo_run += 1

var total_segundos = floor(tempo_run / 60)

var minutos = floor(total_segundos / 60)
var segundos = total_segundos % 60

draw_text(20, 90,
    string(minutos) + ":" +
    string_format(segundos, 2, 0)
)