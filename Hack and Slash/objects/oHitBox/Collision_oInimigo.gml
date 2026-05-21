if other.dano_cooldown <= 0
{
	owner.alvo = other
	owner.acertou_inimigo = true
	other.vida -= dano
    other.dano_cooldown = 20
}

