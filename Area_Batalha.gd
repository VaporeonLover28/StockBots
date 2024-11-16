extends Node2D

@onready var load_player = load("res://player_teste.tscn")
@onready var load_enemy = load("res://enemy_teste.tscn")
var instantiated_player
var instantiated_enemy
var player_has_died = false
var enemy_has_died = false
var timer_explosion_started = false
var timer_death_timer_started = false
@onready var player_sprite_item: Sprite2D = $battle_camera/UI_layer/Player_itemframe_1/Sprite_item
@onready var player_sprite_item_2: Sprite2D = $battle_camera/UI_layer/Player_itemframe_2/Sprite_item
@onready var player_sprite_item_3: Sprite2D = $battle_camera/UI_layer/Player_itemframe_3/Sprite_item
@onready var enemy_sprite_item: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_1/Sprite_item
@onready var enemy_sprite_item_2: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_2/Sprite_item
@onready var enemy_sprite_item_3: Sprite2D = $battle_camera/UI_layer/Enemy_itemframe_3/Sprite_item
@onready var player_item_description_1: RichTextLabel = $battle_camera/UI_layer/Player_itemframe_1/Bigframe/Item_description
@onready var player_item_description_2: RichTextLabel = $battle_camera/UI_layer/Player_itemframe_2/Bigframe/Item_description
@onready var player_item_description_3: RichTextLabel = $battle_camera/UI_layer/Player_itemframe_3/Bigframe/Item_description
@onready var enemy_item_description_1: RichTextLabel = $battle_camera/UI_layer/Enemy_itemframe_1/Bigframe/Item_description
@onready var enemy_item_description_2: RichTextLabel = $battle_camera/UI_layer/Enemy_itemframe_2/Bigframe/Item_description
@onready var enemy_item_description_3: RichTextLabel = $battle_camera/UI_layer/Enemy_itemframe_3/Bigframe/Item_description
var alastorng = false
var alastorinpos = false
var alastelowbird = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(PlayerLoadout.newest_weapon_lv))
	print(str(PlayerLoadout.oldest_weapon_lv))
	$bgmover.play("bg")
	
	#gedagedigedageda-o
	if PlayerLoadout.player_round_life == 3:
		$LiveCounter/HP1.play("full")
		$LiveCounter/HP2.play("full")
		$LiveCounter/HP3.play("full")
	elif PlayerLoadout.player_round_life == 2:
		$LiveCounter/HP1.play("full")
		$LiveCounter/HP2.play("full")
		$LiveCounter/HP3.play("empty")
	elif PlayerLoadout.player_round_life == 1:
		$LiveCounter/HP1.play("full")
		$LiveCounter/HP2.play("empty")
		$LiveCounter/HP3.play("empty")
	elif PlayerLoadout.player_round_life == 0:
		$LiveCounter/HP1.play("empty")
		$LiveCounter/HP2.play("empty")
		$LiveCounter/HP3.play("empty")
	
	instantiated_player = load_player.instantiate()
	instantiated_enemy = load_enemy.instantiate()
	add_child(instantiated_player)
	add_child(instantiated_enemy)
	
	instantiated_player.position.y = 597.991
	instantiated_enemy.position.y = 597.991
	instantiated_player.scale.x = 3
	instantiated_enemy.scale.x = 3
	instantiated_player.scale.y = 3
	instantiated_enemy.scale.y = 3
	instantiated_player.position.x = 254
	instantiated_enemy.position.x = 904

	if instantiated_player.instanciated_weapon1 != null:
		player_sprite_item.texture = instantiated_player.instanciated_weapon1.weapon_resource.weapon_sprite
		player_sprite_item.scale = Vector2(0.66,0.66)
		player_item_description_1.text = instantiated_player.instanciated_weapon1.weapon_resource.Description
		if PlayerLoadout.newest_weapon_lv >= 2:
			$battle_camera/UI_layer/Player_itemframe_1/Item_sparkle1.visible = true
			$battle_camera/UI_layer/Player_itemframe_1/Item_sparkle2.visible = true
		else:
			$battle_camera/UI_layer/Player_itemframe_1/Item_sparkle1.visible = false
			$battle_camera/UI_layer/Player_itemframe_1/Item_sparkle2.visible = false
	if instantiated_player.instanciated_weapon2 != null:
		player_sprite_item_2.texture = instantiated_player.instanciated_weapon2.weapon_resource.weapon_sprite
		player_sprite_item_2.scale = Vector2(0.66,0.66)
		player_item_description_2.text = instantiated_player.instanciated_weapon2.weapon_resource.Description
	if instantiated_player.mode != null:
		player_sprite_item_3.texture = instantiated_player.mode.robo_image
		player_item_description_3.text = instantiated_player.mode.Description
	if instantiated_enemy.instanciated_weapon1 != null:
		enemy_sprite_item.texture = instantiated_enemy.instanciated_weapon1.weapon_resource.weapon_sprite
		enemy_sprite_item.scale = Vector2(0.66,0.66)
		enemy_item_description_1.text = instantiated_enemy.instanciated_weapon1.weapon_resource.Description
	if instantiated_enemy.instanciated_weapon2 != null:
		enemy_sprite_item_2.texture = instantiated_enemy.instanciated_weapon2.weapon_resource.weapon_sprite
		enemy_sprite_item_2.scale = Vector2(0.66,0.66)
		enemy_item_description_2.text = instantiated_enemy.instanciated_weapon2.weapon_resource.Description
	if instantiated_enemy.mode != null:
		enemy_sprite_item_3.texture = instantiated_enemy.mode.robo_image
		enemy_item_description_3.text = instantiated_enemy.mode.Description
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	alastoroll(round(randf_range(0,10000000)))
	
	if alastorng == true:
		#TODO consertar easter egg
		
		$BGMusicStream.playing = false
		if alastorinpos == false and alastelowbird == false:
			$Background/alastnode/hiluxer.position.x += 0.4
		
		if $Background/alastnode/dentodarailucs.playing == false:
			$Background/alastnode/dentodarailucs.playing = true
		
		if $Background/alastnode/hiluxer.position.x >= 275:
			alastorinpos = true
			
		if alastorinpos == true:
			if $Background/alastnode/ureeeeee.playing == false:
				$Background/alastnode/ureeeeee.playing = true
			$Background/alastnode/bird.position.x += 5
			
		if $Background/alastnode/bird.position.x == 275:
			alastorinpos = false
			alastelowbird = true
		
		if alastelowbird == true:
			$Background/alastnode/bird.position += 5
			$Background/alastnode/hiluxer.position.x += 5
	
	if instantiated_player.current_life <= 0 or instantiated_enemy.current_life <= 0:
		#if timer_explosion_started == false:
			#print("algo aí")
			#instantiated_player.robot_player.play("idle")
			#instantiated_enemy.robot_player.play("idle")
		instantiated_enemy.process_game = false
		instantiated_player.process_game = false
		if $explotimer.is_stopped() == true and timer_explosion_started == false:
			$explotimer.start()
			timer_explosion_started == true
		if $deathtimer.is_stopped() == true and timer_death_timer_started == false:
			$deathtimer.start()
			timer_death_timer_started == true

func _on_deathtimer_timeout():
	print("deathtimer")
	if RoundCounter.rounds == 8:
		print("win")
		get_tree().change_scene_to_file("res://Menus/win_scene.tscn")
	elif RoundCounter.rounds < 8:
		if PlayerLoadout.player_round_life > 0:
			if instantiated_player.current_life <= 0 and instantiated_enemy.current_life <= 0:
				PlayerLoadout.current_money += round(4 * RoundCounter.rounds/2)
				RoundCounter.rounds += 1
				player_has_died = true
				enemy_has_died = true
				get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
			elif  instantiated_player.current_life <= 0 and instantiated_enemy.current_life > 0:
				print("enemy win")
				player_has_died = true
				get_tree().change_scene_to_file("res://round_loss_scene.tscn")
			elif instantiated_enemy.current_life <= 0 and instantiated_player.current_life > 0:
				print("player win")
				PlayerLoadout.current_money += round(4 * RoundCounter.rounds/2)
				RoundCounter.rounds += 1
				enemy_has_died = true
				get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
		else:
			if instantiated_player.current_life <= 0 and instantiated_enemy.current_life <= 0:
				print("draw")
				PlayerLoadout.current_money += round(4 * RoundCounter.rounds/2)
				RoundCounter.rounds += 1
				player_has_died = true
				enemy_has_died = true
				get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
			elif  instantiated_player.current_life <= 0 and instantiated_enemy.current_life > 0:
				print("enemy win")
				player_has_died = true
				get_tree().change_scene_to_file("res://Menus/loss_scene.tscn")
			elif instantiated_enemy.current_life <= 0 and instantiated_player.current_life > 0:
				print("player win")
				PlayerLoadout.current_money += round(4 * RoundCounter.rounds/2)
				RoundCounter.rounds += 1
				enemy_has_died = true
				get_tree().change_scene_to_file("res://Menus/upgraged_scene.tscn")
	$deathtimer.stop()

func _on_explotimer_timeout() -> void:
	print("explosiontimer")
	if instantiated_player.current_life <= 0:
		instantiated_player.robot_player.play("explosion")
		if instantiated_player.instanciated_weapon1 != null:
			instantiated_player.instanciated_weapon1.visible = false
		if instantiated_player.instanciated_weapon2 != null:
			instantiated_player.instanciated_weapon2.visible = false
	if instantiated_enemy.current_life <= 0:
		instantiated_enemy.robot_player.play("explosion")
		if instantiated_enemy.instanciated_weapon1 != null:
			instantiated_enemy.instanciated_weapon1.visible = false
		if instantiated_enemy.instanciated_weapon2 != null:
			instantiated_enemy.instanciated_weapon2.visible = false

func _on_suddendeathtimer_timeout() -> void:
	instantiated_enemy.current_life = 1
	instantiated_player.current_life = 1

func alastoroll(number):
	if number == 4145708:
		print(number)
		print("DENTRO DA HILUUUUUUUUUUUUUUX")
		alastorng = true
	elif alastorng == false:
		print(number)
