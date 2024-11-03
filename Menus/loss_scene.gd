extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		PlayerLoadout.current_money = 4
		RoundCounter.reroll_price = 1
		RoundCounter.rounds = 0
		PlayerLoadout.player_round_life = 3
		PlayerLoadout.times_passed_item = 0
		PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
		PlayerLoadout.oldest_weapon = null
		PlayerLoadout.current_mode = load("res://Modes/basic.tres")
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")
	
func _on_button_pressed() -> void:
	PlayerLoadout.current_money = 4
	RoundCounter.reroll_price = 1
	RoundCounter.rounds = 0
	PlayerLoadout.player_round_life = 3
	PlayerLoadout.times_passed_item = 0
	PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
	PlayerLoadout.oldest_weapon = null
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
