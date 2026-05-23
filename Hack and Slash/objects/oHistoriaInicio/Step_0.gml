timer_intro++

if timer_intro > 0
{
    alpha1 += 0.02
}

if timer_intro > 200
{
    alpha2 += 0.02
}

if timer_intro > 400
{
    alpha3 += 0.02
}

if timer_intro > 600
{
    alpha4 += 0.02
}

if timer_intro > 900 {
	room_goto(rmFase01)
}

// limita em 1
alpha1 = clamp(alpha1, 0, 1)
alpha2 = clamp(alpha2, 0, 1)
alpha3 = clamp(alpha3, 0, 1)
alpha4 = clamp(alpha4, 0, 1)