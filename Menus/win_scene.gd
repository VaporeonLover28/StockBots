extends CanvasLayer

@onready var PIZZA_EYE = preload("res://pizza eye.jpg")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Especial"):
		$Pizza.texture = PIZZA_EYE
		$Label.text = "Do not belive in their lies, stupid robot"
		$Label2.text = "The pizza is not real! you will die like the others"

func _on_back_menu_button_pressed() -> void:
	PlayerLoadout.newest_weapon = PlayerLoadout.all_weapons.pick_random()
	PlayerLoadout.oldest_weapon = null
	PlayerLoadout.current_mode = load("res://Modes/basic.tres")
	RoundCounter.rounds = 0 
	PlayerLoadout.times_passed_item = 0
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
