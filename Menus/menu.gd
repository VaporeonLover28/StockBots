extends Control

var secret_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	secret_pressed = false
	$ColorRect2.set_color(Color("01001f7f"))
	$Anim.play("anim_menu")
	RoundCounter.rounds = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Especial"):
		secret_pressed = true
		$ColorRect2.visible = true
		$ColorRect2.set_color(Color("000000b1"))
	
	if Input.is_action_just_pressed("ui_accept"):
		start()

func start():
	if secret_pressed == false:
		PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
		PlayerLoadout.oldest_weapon = null
	else:
		PlayerLoadout.newest_weapon = load("res://Weapons/secret.tres")
		PlayerLoadout.oldest_weapon = load("res://Weapons/secret.tres")
	PlayerLoadout.current_money = 4
	RoundCounter.reroll_price = 1
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_start_btn_pressed():
	if secret_pressed == false:
		PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
		PlayerLoadout.oldest_weapon = null
	else:
		PlayerLoadout.newest_weapon = load("res://Weapons/secret.tres")
		PlayerLoadout.oldest_weapon = load("res://Weapons/secret.tres")
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://introduction.tscn")

func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://Menus/credits_scene.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
