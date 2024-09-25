extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Especial"):
		$Back_menu_button.text = "Next victim"
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
	RoundCounter.rounds = 0 
	PlayerLoadout.times_passed_item = 0
	PlayerLoadout.newest_weapon = RoundCounter.current_item_weapons.pick_random()
	PlayerLoadout.oldest_weapon = null
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
