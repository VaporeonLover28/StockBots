extends Area2D

func _ready() -> void:
	$"../Bigframe".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	if AlreadyOpen.UI_is_open == false:
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
		AlreadyOpen.boxopen(self)
		AlreadyOpen.UI_is_open = true

func _on_mouse_exited() -> void:
	$CollisionShape2D.position.x = 0
	$CollisionShape2D.position.y = 0
	$CollisionShape2D.scale.x = 1
	$CollisionShape2D.scale.y = 1
	$"../Bigframe/Item_description".visible = false
	$"../Bigframe".visible = false
	AlreadyOpen.UI_is_open = false
