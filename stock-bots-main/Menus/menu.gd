extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anim.play("anim_menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_credits_btn_pressed():
	pass # Replace with function body.

func _on_quit_btn_pressed():
	get_tree().quit()
