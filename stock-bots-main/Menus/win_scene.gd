extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RoundCounter.rounds = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/menu.tscn")
