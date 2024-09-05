extends TextureProgressBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../../../".player_has_died == false or $"../../../".enemy_has_died == false:
		value = $"../../../".instantiated_player.current_life * 100 / $"../../../".instantiated_player.max_life
	if $"../../../".player_has_died == true:
		value = 0
