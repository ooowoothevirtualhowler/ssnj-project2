/// @description Take Damage from Enemy

if !invincible {
	invincible = true;
	current_health -= other.attack_damage;
	alarm[0] = hit_invincibility_time;
}