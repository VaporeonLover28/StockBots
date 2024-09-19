extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anim.play("anim_menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		start()

func start():
	PlayerLoadout.newest_weapon = PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.oldest_weapon = null
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_start_btn_pressed():
	start()

func _on_credits_btn_pressed():
	pass # Replace with function body.

func _on_quit_btn_pressed():
	get_tree().quit()
