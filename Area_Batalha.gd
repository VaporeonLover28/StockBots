extends Node2D

@onready var load_player = load("res://player_teste.tscn")
@onready var load_enemy = load("res://enemy_teste.tscn")
var instantiated_player
var instantiated_enemy
var player_has_died = false
var enemy_has_died = false
@onready var player_sprite_item: Sprite2D = $battle_camera/UI_layer/Player_itemframe_1/Sprite_item
@onready var player_sprite_item_2: Sprite2D = $battle_camera/UI_layer/Player_itemframe_2/Sprite_item
@onready var player_sprite_item_3: Sprite2D = $battle_camera/UI_layer/Player_itemframe_3/Sprite_item
@onready var enemy_sprite_item: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_1/Sprite_item
@onready var enemy_sprite_item_2: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_2/Sprite_item
@onready var enemy_sprite_item_3: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_3/Sprite_item

# Called when the node enters the scene tree for the first time.
func _ready():
	
	instantiated_player = load_player.instantiate()
	instantiated_enemy = load_enemy.instantiate()
	add_child(instantiated_player)
	add_child(instantiated_enemy)
	
	
	instantiated_player.position.y = 572
	instantiated_enemy.position.y = 570
	instantiated_player.scale.x = 3
	instantiated_enemy.scale.x = 3
	instantiated_player.scale.y = 3
	instantiated_enemy.scale.y = 3
	instantiated_player.position.x = 254
	instantiated_enemy.position.x = 904

	if instantiated_player.instanciated_weapon1 != null:
		player_sprite_item.texture = instantiated_player.instanciated_weapon1.weapon_resource.weapon_sprite
		player_sprite_item.scale = Vector2(0.66,0.66)
	if instantiated_player.instanciated_weapon2 != null:
		player_sprite_item_2.texture = instantiated_player.instanciated_weapon2.weapon_resource.weapon_sprite
		player_sprite_item_2.scale = Vector2(0.66,0.66)
	if instantiated_player.mode != null:
		player_sprite_item_3.texture = instantiated_player.mode.robo_image
	if instantiated_enemy.instanciated_weapon1 != null:
		enemy_sprite_item.texture = instantiated_enemy.instanciated_weapon1.weapon_resource.weapon_sprite
		enemy_sprite_item.scale = Vector2(0.66,0.66)
	if instantiated_enemy.instanciated_weapon2 != null:
		enemy_sprite_item_2.texture = instantiated_enemy.instanciated_weapon2.weapon_resource.weapon_sprite
		enemy_sprite_item_2.scale = Vector2(0.66,0.66)
	if instantiated_enemy.mode != null:
		enemy_sprite_item_3.texture = instantiated_enemy.mode.robo_image
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_has_died == false and enemy_has_died == false:
		if RoundCounter.rounds > 5:
			get_tree().change_scene_to_file("res://Menus/win_scene.tscn")
		if  instantiated_player.current_life <= 0 and instantiated_enemy.current_life <= 0:
			RoundCounter.rounds += 1
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
