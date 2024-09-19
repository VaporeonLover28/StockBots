extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerLoadout.newest_weapon != null:
		$VBoxContainer/Current_weapon1.text = "First weapon: " + PlayerLoadout.newest_weapon.Item_name
	else:
		$VBoxContainer/Current_weapon1.text = "First weapon: none"
	if PlayerLoadout.oldest_weapon != null:
		$VBoxContainer/Current_weapon2.text = "Second weapon: " + PlayerLoadout.oldest_weapon.Item_name
	else:
		$VBoxContainer/Current_weapon2.text = "Second weapon: none"
	$VBoxContainer/Current_Mode.text = "Mode: " + PlayerLoadout.current_mode.Item_name
