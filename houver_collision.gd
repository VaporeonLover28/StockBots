extends Area2D

@onready var mouse_houver = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_houver == true:
		$"../Item_description".visible = true
	if mouse_houver == false:
		$"../Item_description".visible = false

func _on_mouse_entered() -> void:
	mouse_houver = true

func _on_mouse_exited() -> void:
	mouse_houver = false
