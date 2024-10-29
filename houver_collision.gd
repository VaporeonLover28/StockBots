extends Area2D

@onready var mouse_houver = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_houver == true:
		if self.is_in_group("player_frames"):
			$CollisionShape2D.position.x = 47.5
			$CollisionShape2D.position.y = 47.5
			$CollisionShape2D.scale.x = 4
			$CollisionShape2D.scale.y = 4
		elif self.is_in_group("enemy_frames"):
			$CollisionShape2D.position.x = -40
			$CollisionShape2D.position.y = 47.5
			$CollisionShape2D.scale.x = 4
			$CollisionShape2D.scale.y = 4
		$"../Bigframe/Item_description".visible = true
		$"../Bigframe".visible = true
	if mouse_houver == false:
		$CollisionShape2D.position.x = 0
		$CollisionShape2D.position.y = 0
		$CollisionShape2D.scale.x = 1
		$CollisionShape2D.scale.y = 1
		$"../Bigframe/Item_description".visible = false
		$"../Bigframe".visible = false

func _on_mouse_entered() -> void:
	mouse_houver = true

func _on_mouse_exited() -> void:
	mouse_houver = false
