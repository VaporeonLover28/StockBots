extends BoxContainer

@onready var Item_loaded = RoundCounter.current_item_pool.pick_random()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Item_loaded.Item_type == 1:
		$VBoxContainer/Item_sprite.texture = Item_loaded.weapon_sprite 
		$VBoxContainer/Item_sprite.scale = Vector2(3,3)
		$VBoxContainer/Item_name.text = Item_loaded.Item_name + ": Weapon"
		$VBoxContainer/Item_Label.text = Item_loaded.weapon_type
		$VBoxContainer/Item_Label2.text = "Damage: " + str(Item_loaded.weapon_damage)
		$VBoxContainer/Item_Label3.text = "Range: " + str(Item_loaded.weapon_range)
		$VBoxContainer/Item_Label4.text = "Weapon reload: " + str(Item_loaded.weapon_cooldown) + "s"
		$VBoxContainer/Item_Label5.text = "Weapon knockback: " + str(Item_loaded.weapon_knockback)
	if Item_loaded.Item_type == 0:
		$VBoxContainer/Item_sprite.texture = Item_loaded.robo_image
		$VBoxContainer/Item_sprite.scale = Vector2(3, 3)
		$VBoxContainer/Item_name.text = Item_loaded.Item_name + ": Mode"
		$VBoxContainer/Item_Label.text = "Mode agressivity: " + Item_loaded.mode_agressivity
		$VBoxContainer/Item_Label2.text = "Extra life: " + str(Item_loaded.extra_life)
		$VBoxContainer/Item_Label3.text = "Extra velocity: " + str(Item_loaded.extra_VL)
		$VBoxContainer/Item_Label4.text = "Extra range: " + str(Item_loaded.extra_range)
		$VBoxContainer/Item_Label5.text = "Extra damage: " + str(Item_loaded.extra_damage)
