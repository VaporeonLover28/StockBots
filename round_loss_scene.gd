extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerLoadout.player_round_life -= 1
	$Button.text = "Try again (Round " + str(RoundCounter.rounds) + ")"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
