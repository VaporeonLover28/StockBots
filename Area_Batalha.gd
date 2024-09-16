extends Node2D

@onready var load_player = load("res://player_teste.tscn")
@onready var load_enemy = load("res://enemy_teste.tscn")
var instantiated_player
var instantiated_enemy
var player_has_died = false
var enemy_has_died = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	instantiated_player = load_player.instantiate()
	instantiated_enemy = load_enemy.instantiate()
	add_child(instantiated_player)
	add_child(instantiated_enemy)
	
	print(instantiated_player.side)
	
	instantiated_player.position.y = 575
	instantiated_enemy.position.y = 570
	instantiated_player.scale.x = 3
	instantiated_enemy.scale.x = 3
	instantiated_player.scale.y = 3
	instantiated_enemy.scale.y = 3
	instantiated_player.position.x = 254
	instantiated_enemy.position.x = 904

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_has_died == false and enemy_has_died == false:
		if RoundCounter.rounds > 5:
			get_tree().change_scene_to_file("res://Menus/win_scene.tscn")
		if  instantiated_player.current_life <= 0 and instantiated_enemy.current_life <= 0:
			player_has_died = true
			enemy_has_died = true
			get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
		if  instantiated_player.current_life <= 0 and instantiated_enemy.current_life > 0:
			player_has_died = true
			get_tree().change_scene_to_file("res://loss_scene.tscn")
		if instantiated_enemy.current_life <= 0 and instantiated_player.current_life > 0:
			RoundCounter.rounds += 1
			enemy_has_died = true
			get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
