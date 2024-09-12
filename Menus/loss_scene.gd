extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	RoundCounter.rounds = 0
	PlayerLoadout.newest_weapon = PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.oldest_weapon =PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.current_mode =PlayerLoadout.all_modes.pick_random()
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
