extends Node2D

#ice: 556. 244

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	PlayerLoadout.player_round_life -= 1
	$Button.text = "Try again (Round " + str(RoundCounter.rounds) + ")"
	if PlayerLoadout.player_round_life == 2:
		$Button/LivesRemain.text = "Three attempts remaining."
	elif PlayerLoadout.player_round_life == 1:
		$Button/LivesRemain.text = "Two attempts remaining."
	elif PlayerLoadout.player_round_life == 0:
		$Button/LivesRemain.text = "Last attempt remaining."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
