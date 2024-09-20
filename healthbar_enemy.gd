extends TextureProgressBar


func _process(delta):
	if $"../../../".enemy_has_died == false or $"../../../".player_has_died == false:
		value = $"../../../".instantiated_enemy.current_life * 100 / $"../../../".instantiated_enemy.max_life
	if $"../../../".enemy_has_died == true:
		value = 0

func _on_enemy_damage_timer_timeout() -> void:
	$Damagebar_Enemy.value = value

func _on_value_changed(value: float) -> void:
	$Enemy_damage_timer.start()
