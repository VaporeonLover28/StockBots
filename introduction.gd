extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_button_pressed() -> void:
	PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
	#PlayerLoadout.newest_weapon = load("res://Weapons/secret.tres")
	#PlayerLoadout.oldest_weapon = load("res://Weapons/secret.tres")
	PlayerLoadout.oldest_weapon = null
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
