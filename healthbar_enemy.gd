extends TextureProgressBar


func _process(delta):
	if $"../../../".enemy_has_died == false or $"../../../".enemy_has_died == false:
		value = $"../../../".instantiated_enemy.current_life * 100 / $"../../../".instantiated_enemy.max_life
	if $"../../../".enemy_has_died == true:
		value = 0
