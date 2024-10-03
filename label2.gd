extends Label

func _process(delta: float) -> void:
	text = str($"../../..".instantiated_enemy.max_life)
