extends CanvasLayer

var secret_pressed = false
var c_pressed = false
var t_pressed = false
var r_pressed = false
var l_pressed = false
var p_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Especial") or c_pressed == true and t_pressed == true and r_pressed == true and l_pressed == true and p_pressed == true:
		secret_pressed = true
	
	if secret_pressed == true:
		$Restart.text = "Next victim"
		$Pizza.animation = "eye"
		$Label.text = "Do not belive in their lies, stupid robot."
		$Label2.text = "The pizza is not real. you will die like all the others."
		$P.visible = false
		$C.visible = false
		$T.visible = false
		$R.visible = false
		$L.visible = false
		$"creepy music".play()
		
func _on_back_menu_button_pressed() -> void:
	PlayerLoadout.current_money = 4
	RoundCounter.reroll_price = 1
	RoundCounter.rounds = 0 
	PlayerLoadout.newest_weapon_lv = 1
	PlayerLoadout.oldest_weapon_lv = 1
	PlayerLoadout.player_round_life = 3
	PlayerLoadout.times_passed_item = 0
	if secret_pressed == false:
		PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
		PlayerLoadout.oldest_weapon = null
	else:
		PlayerLoadout.newest_weapon = load("res://Weapons/secret.tres")
		PlayerLoadout.oldest_weapon = load("res://Weapons/secret.tres")
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_ng_plus_pressed() -> void:
	if RoundCounter.timeswon > 1:
		PlayerLoadout.current_money = 4
		RoundCounter.reroll_price = 1
		RoundCounter.rounds = 0 
		PlayerLoadout.player_round_life = 3
		PlayerLoadout.times_passed_item = 0
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")
	else:
		pass

func _on_c_pressed() -> void:
	c_pressed = true
	$C.visible = false

func _on_t_pressed() -> void:
	t_pressed = true
	$T.visible = false

func _on_r_pressed() -> void:
	r_pressed = true
	$R.visible = false

func _on_l_pressed() -> void:
	l_pressed = true
	$L.visible = false

func _on_p_pressed() -> void:
	p_pressed = true
	$P.visible = false
