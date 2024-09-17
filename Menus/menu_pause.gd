extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_pressed("pause"):
		visible = true
		$Anim_p.play("anim_pause")

func _on_anim_p_animation_finished(_anim_name):
	get_tree().paused = true

func _on_resume_btn_pressed():
	visible = false
	get_tree().paused = false

func _on_menu_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/menu.tscn")

func _on_quit_bnt_2_pressed():
	get_tree().quit()

func _on_restart_pressed() -> void:
	RoundCounter.rounds = 0
	PlayerLoadout.newest_weapon = PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.oldest_weapon =PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.current_mode =PlayerLoadout.all_modes.pick_random()
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
